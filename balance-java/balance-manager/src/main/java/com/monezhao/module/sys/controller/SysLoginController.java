package com.monezhao.module.sys.controller;

import com.google.code.kaptcha.Producer;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.bean.utilsVo.SysLoginForm;
import com.monezhao.common.Constants;
import com.monezhao.common.Result;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.JwtUtil;
import com.monezhao.common.util.PasswordUtil;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.config.DefaultSystemConfig;
import com.monezhao.module.sys.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.entity.ContentType;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Objects;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:21
 * @Description: 登录controller
 */
@RestController
@RequestMapping("/sys")
@Slf4j
@Api(tags = "后台用户登录")
public class SysLoginController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private Producer producer;

    @Autowired
    private DefaultSystemConfig defaultSystemConfig;

    @GetMapping("captcha.jpg")
    @ApiOperation("获取验证码")
    public void captcha(HttpServletResponse response, String uuid) {
        response.setHeader("Cache-Control", "no-store, no-cache");
        response.setContentType(ContentType.IMAGE_JPEG.getMimeType());
        String text = producer.createText();
        redisUtil.set(Constants.PREFIX_USER_KAPTCHA + uuid, text, 60);
        BufferedImage image = producer.createImage(text);
        try (ServletOutputStream out = response.getOutputStream()) {
            ImageIO.write(image, "jpg", out);
        } catch (IOException e) {
            log.error("生成验证码失败", e);
            throw new SysException("生成验证码失败", e);
        }
    }

    @GetMapping("useCaptcha")
    @ApiOperation("是否使用图片验证码")
    public Result useCaptcha() {
        String useCaptcha = (String) redisUtil.get(
                Constants.PREFIX_SYS_CONFIG + "useCaptcha",
                defaultSystemConfig.getUseCaptcha()
        );
        return Result.ok(useCaptcha);
    }

    @SysLogAuto(value = "用户登录", logType = "1")
    @PostMapping(value = "/login")
    @ApiOperation("用户登录")
    @ApiResponses({@ApiResponse(code = 200, message = "登录成功，返回数据data包含token:\ndata={\"token\":\"xxx\"}")})
    public Result login(@RequestBody SysLoginForm sysLoginForm) {
        CommonUtil.isEmptyStr(sysLoginForm.getUserId(), "用户名不能为空");
        CommonUtil.isEmptyStr(sysLoginForm.getPassword(), "密码不能为空");

        String useCaptcha = (String) redisUtil.get(
                Constants.PREFIX_SYS_CONFIG + "useCaptcha",
                defaultSystemConfig.getUseCaptcha()
        );
        // 验证码校验
        if ("0".equals(useCaptcha)) {
            CommonUtil.isEmptyStr(sysLoginForm.getUuid(), "验证码uuid不能为空");
            CommonUtil.isEmptyStr(sysLoginForm.getCaptcha(), "验证码不能为空");
            Object o = redisUtil.get(Constants.PREFIX_USER_KAPTCHA + sysLoginForm.getUuid());
            redisUtil.del(Constants.PREFIX_USER_KAPTCHA + sysLoginForm.getUuid());
            if (Objects.isNull(o)) {
                return Result.error("验证码已失效");
            } else if (!Objects.equals(sysLoginForm.getCaptcha(), o)) {
                return Result.error("验证码错误");
            }
        }

        String userId = sysLoginForm.getUserId();
        SysUser sysUser = sysUserService.getById(userId);
        CommonUtil.isEmptyObject(sysUser, "该用户不存在");

        String password = PasswordUtil.encrypt(sysLoginForm.getPassword(), sysUser.getSalt());
        if (!password.equals(sysUser.getPassword())) {
            return Result.error("用户名或密码错误");
        }
        // 生成token,不传入token过期时间，在使用JwtUtil.verify时不会校验过期时间
        String token = JwtUtil.sign(userId, password);
        // 使用redis管理token过期时间
        redisUtil.set(Constants.PREFIX_USER_TOKEN + userId, token, JwtUtil.EXPIRE_TIME);
        HashMap<String, String> obj = new HashMap<>(1);
        obj.put("token", token);
        return Result.ok(obj);
    }

    /**
     * 注销登录
     *
     * @return
     */
    @SysLogAuto(value = "用户注销")
    @PostMapping(value = "/logout")
    @ApiOperation("用户注销")
    public Result logout() {
        // 用户注销逻辑
        Subject subject = ShiroUtils.getSubject();
        SessionObject sessionObject = (SessionObject) subject.getPrincipal();
        if (sessionObject == null) {
            return Result.ok("注销成功！");
        }
        SysUser sysUser = sessionObject.getSysUser();
        log.info("用户名:" + sysUser.getUserName() + ",注销成功！ ");
        subject.logout();
        // 清空用户Token缓存
        redisUtil.del(Constants.PREFIX_USER_TOKEN + sysUser.getUserId());
        // 清空用户sessionObject缓存
        redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId());
        return Result.ok("注销成功！");
    }
}