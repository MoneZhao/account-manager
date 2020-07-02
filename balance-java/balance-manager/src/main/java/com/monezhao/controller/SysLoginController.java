package com.monezhao.controller;

import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.bean.utilsVo.SysLoginForm;
import com.monezhao.common.Constants;
import com.monezhao.common.Result;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.JwtUtil;
import com.monezhao.common.util.PasswordUtil;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;


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

    @SysLogAuto(value = "用户登录", logType = "1")
    @PostMapping(value = "/login")
    @ApiOperation("用户登录")
    @ApiResponses({@ApiResponse(code = 200, message = "登录成功，返回数据data包含token:\ndata={\"token\":\"xxx\"}")})
    public Result login(@RequestBody SysLoginForm sysLoginForm) {
        CommonUtil.isEmptyStr(sysLoginForm.getUserId(), "用户名不能为空");
        CommonUtil.isEmptyStr(sysLoginForm.getPassword(), "密码不能为空");

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
