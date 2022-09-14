package com.monezhao.controller;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysPicUpDown;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.bean.utilsVo.ShortCut;
import com.monezhao.bean.utilsVo.SysPasswordForm;
import com.monezhao.common.Constants;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.CustomCellWriteHandler;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.IpUtils;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.controller.command.SysUserIndex;
import com.monezhao.controller.command.UserShortCut;
import com.monezhao.service.SysConfigService;
import com.monezhao.service.SysPicUpDownService;
import com.monezhao.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.xml.bind.DatatypeConverter;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;

/**
 * 用户Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/user")
@Api(tags = "用户")
@ApiSupport(author = "monezhao@163.com")
public class SysUserController extends BaseController {
    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysConfigService sysConfigService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private SysPicUpDownService picUpDownService;

    /**
     * 自定义查询列表
     *
     * @param sysUser
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:user:list")
    @GetMapping(value = "/list")
    @ApiOperation("用户列表")
    public Result list(SysUser sysUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysUser> pageList = sysUserService.list(new Page<>(current, size), sysUser);
        return Result.ok(pageList);
    }

    /**
     * 公共选人查询
     *
     * @param sysUser
     * @param current
     * @param size
     * @return
     */
    @GetMapping(value = "/listSelectUser")
    @ApiOperation("公共选人查询")
    public Result listSelectUser(SysUser sysUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysUser> pageList = sysUserService.listSelectUser(new Page<>(current, size), sysUser);
        return Result.ok(pageList);
    }

    /**
     * 查询部门下的人员信息
     *
     * @author zym
     * @date 2020/11/3 10:41
     */
    @GetMapping(value = "/queryUserByOrg")
    @ApiOperation("查询部门下的人员信息")
    public Result queryUserByOrg(SysUser sysUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysUser> pageList = sysUserService.queryUserByOrg(new Page<>(current, size), sysUser);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:user:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("用户查询")
    public Result queryById(@RequestParam String id) {
        SysUser sysUser = sysUserService.getById(id);
        return Result.ok(sysUser);
    }

    /**
     * @param sysUser
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增用户")
    @RequiresPermissions("sys:user:save")
    @PostMapping(value = "/save")
    @ApiOperation("用户新增")
    @ApiOperationSupport(ignoreParameters = {
            "userId",
    })
    public Result save(@Valid @RequestBody SysUser sysUser) {
        sysUserService.saveSysUser(sysUser);
        return Result.ok();
    }

    /**
     * @param sysUsers
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "批量新增用户")
    @RequiresPermissions("sys:user:save")
    @PostMapping(value = "/saveBatch")
    @ApiOperation("批量用户新增")
    @ApiOperationSupport(ignoreParameters = {
            "userId",
    })
    public Result saveBatch(@Valid @RequestBody List<SysUser> sysUsers) {
        sysUserService.saveBatchSysUser(sysUsers);
        return Result.ok();
    }

    /**
     * @param sysUser
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改用户")
    @RequiresPermissions("sys:user:update")
    @PutMapping(value = "/update")
    @ApiOperation("用户修改")
    public Result update(@Valid @RequestBody SysUser sysUser) {
        sysUserService.updateSysUser(sysUser);
        // 清空用户sessionObject缓存
        redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId());
        return Result.ok();
    }

    @SysLogAuto(value = "修改用户个人信息")
    @PutMapping(value = "/editPersonalInfo")
    @ApiOperation("修改用户个人信息")
    public Result editPersonalInfo(@Valid @RequestBody SysUser sysUser) {
        sysUserService.updateSysUser(sysUser);
        // 清空用户sessionObject缓存
        redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId());
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除用户")
    @RequiresPermissions("sys:user:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("用户删除")
    public Result delete(@RequestParam String ids) {
        sysUserService.delete(ids);
        // 清空用户sessionObject缓存
        String[] idsArr = ids.split(",");
        for (String userId : idsArr) {
            redisUtil.del(Constants.PREFIX_USER_TOKEN + userId);
            redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + userId);
        }
        return Result.ok();
    }

    @SysLogAuto(value = "获取用户信息")
    @GetMapping(value = "/getUserInfo")
    @ApiOperation("获取用户信息")
    public Result getUserInfo(@RequestParam(required = false) String roleId, HttpServletRequest request) {
        SysUser sysUser = sysUserService.getById(ShiroUtils.getUserId());

        SessionObject sessionObject;
        if (redisUtil.hasKey(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId())) {
            sessionObject = (SessionObject) redisUtil.get(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId());
            if (sessionObject != null && roleId != null && Objects.equals(sessionObject.getSysRole().getRoleId(), roleId)) {
                return Result.ok(sessionObject);
            }
        }

        List<ShortCut> menuList = sysUserService.getMenuShortCut(sysUser.getUserId(),
                roleId == null ? sysUser.getRoleId() : roleId);
        sessionObject = sysUserService.saveGetUserInfo(sysUser, roleId);
        sessionObject.setLoginTime(DateUtil.getNow());
        sessionObject.setIpAddr(IpUtils.getIpAddr(request));
        sessionObject.setToken((String) redisUtil.get(Constants.PREFIX_USER_TOKEN + sysUser.getUserId()));
        sessionObject.setMenuList(menuList);
        if (sysUser.getPicId() != null) {
            SysPicUpDown picUpDown = picUpDownService.getById(sysUser.getPicId());
            if (picUpDown != null) {
                if (picUpDown.getPicName().toLowerCase(Locale.ROOT).endsWith(".png")) {
                    sessionObject.setAvatar(
                            "data:image/png;base64," + DatatypeConverter.printBase64Binary(picUpDown.getPic())
                    );
                } else {
                    sessionObject.setAvatar(
                            "data:image/jpg;base64," + DatatypeConverter.printBase64Binary(picUpDown.getPic())
                    );
                }
            }
        }
        String expireTime = sysConfigService.getSysConfig("expireTime");
        redisUtil.set(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId(), sessionObject, Long.parseLong(expireTime));
        return Result.ok(sessionObject);
    }

    @PostMapping(value = "/updatePassword")
    @SysLogAuto(value = "用户更新密码")
    @ApiOperation("用户更新密码")
    public Result updatePassword(@RequestBody SysPasswordForm sysPasswordForm) {
        boolean success = sysUserService.updatePassword(sysPasswordForm);
        if (!success) {
            return Result.error("原密码错误");
        }
        return Result.ok();
    }

    @PostMapping(value = "/uploadPic")
    @SysLogAuto(value = "用户更新头像")
    @ApiOperation("用户更新头像")
    public Result uploadPic(@RequestParam MultipartFile file) {
        String id = picUpDownService.upload(file);
        String userId = ShiroUtils.getUserId();
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setPicId(id);
        sysUserService.updateById(sysUser);
        // 清空用户sessionObject缓存
        redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + userId);
        return Result.ok();
    }


    @PostMapping(value = "/updateUserPic")
    @SysLogAuto(value = "用户更新头像")
    @ApiOperation("用户更新头像")
    public Result updateUserPic(@RequestBody SysUser sysUser) {
        CommonUtil.isEmptyStr(sysUser.getPicId(), "头像id不能为空");
        String userId = ShiroUtils.getUserId();
        sysUser.setUserId(userId);
        sysUserService.updateById(sysUser);
        // 清空用户sessionObject缓存
        redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + userId);
        return Result.ok();
    }

    /**
     * @param sysUser
     * @return
     * @功能：重置密码
     */
    @SysLogAuto(value = "重置密码")
    @RequiresPermissions("sys:user:update")
    @PostMapping(value = "/resetPassword")
    @ApiOperation("用户重置密码")
    @ApiOperationSupport(includeParameters = {
            "userId"
    })
    public Result resetPassword(@RequestBody SysUser sysUser) {
        sysUserService.resetPassword(sysUser.getUserId());
        return Result.ok();
    }

    @SysLogAuto(value = "导出全部用户信息")
    @RequiresPermissions("sys:user:export")
    @GetMapping(value = "/export")
    @ApiOperation("导出全部用户信息")
    public void export(HttpServletResponse response) {
        try {
            IPage<SysUser> page = sysUserService.list(null, new SysUser());
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename=SysUserExport.xlsx");
            EasyExcel.write(response.getOutputStream(), SysUser.class)
                    .registerWriteHandler(new CustomCellWriteHandler())
                    .sheet("SysUser").doWrite(page.getRecords());
        } catch (Exception e) {
            throw new SysException("下载文件失败：" + e.getMessage());
        }
    }

    @PostMapping("index")
    @ApiOperation("首页")
    public Result index(@RequestBody SysUser sysUser) {
        SysUserIndex sysUserIndex = new SysUserIndex();
        sysUserIndex.setTotalVisitCount(sysUserService.findTotalVisitCount());
        sysUserIndex.setTodayVisitCount(sysUserService.findTodayVisitCount());
        sysUserIndex.setTodayIp(sysUserService.findTodayIp());
        sysUserIndex.setLastSevenVisitCount(sysUserService.findLastSevenDaysVisitCount(null));
        sysUserIndex.setLastSevenUserVisitCount(sysUserService.findLastSevenDaysVisitCount(sysUser.getUserName()));
        return Result.ok(sysUserIndex);
    }

    /**
     * 查询用户已授权快捷方式
     *
     * @param roleId
     * @param userId
     * @return
     */
    @GetMapping(value = "/getAuthMenuList")
    @ApiOperation("查询用户已授权快捷方式")
    public Result getAuthMenuList(String roleId, String userId) {
        if (Objects.isNull(userId)) {
            SysUser sysUser = ShiroUtils.getSysUser();
            userId = sysUser.getUserId();
        }
        Map<String, Object> data = sysUserService.getAuthMenuList(roleId, userId);
        return Result.ok(data);
    }

    /**
     * 修改用户快捷方式
     *
     * @return
     */
    @PostMapping(value = "/userShortCutSave")
    @SysLogAuto(value = "修改用户快捷方式")
    @ApiOperation("修改用户快捷方式")
    public Result userShortCutSave(@RequestBody UserShortCut userShortCut) {
        CommonUtil.isEmptyStr(userShortCut.getUserId(), "未指定用户");
        CommonUtil.isEmptyStr(userShortCut.getRoleId(), "未指定角色");
        sysUserService.userShortCutSave(userShortCut);
        // 清空用户sessionObject缓存
        redisUtil.del(Constants.PREFIX_USER_SESSION_OBJECT + userShortCut.getUserId());
        return Result.ok();
    }
}
