package com.monezhao.modules.sys.controller;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.to.SysUserIndex;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.bean.utilsVo.SysPasswordForm;
import com.monezhao.common.Constants;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.IpUtils;
import com.monezhao.common.util.JwtUtil;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.modules.sys.service.SysUserService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * 用户Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/user")
@Api(tags = "用户")
public class SysUserController extends BaseController {
    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private RedisUtil redisUtil;

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
        IPage<SysUser> pageList = sysUserService.list(new Page<SysUser>(current, size), sysUser);
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
        IPage<SysUser> pageList = sysUserService.listSelectUser(new Page<SysUser>(current, size), sysUser);
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
    public Result save(@Valid @RequestBody SysUser sysUser) {
        sysUserService.saveSysUser(sysUser);
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
        return Result.ok();
    }

    @SysLogAuto(value = "获取用户信息")
    @GetMapping(value = "/getUserInfo")
    @ApiOperation("获取用户信息")
    public Result getUserInfo(@RequestParam(required = false) String roleId, HttpServletRequest request) {
        SysUser sysUser = sysUserService.getById(ShiroUtils.getUserId());
        SessionObject sessionObject = sysUserService.saveGetUserInfo(sysUser, roleId);
        sessionObject.setLoginTime(DateUtil.getNow());
        sessionObject.setIpAddr(IpUtils.getIpAddr(request));
        sessionObject.setToken((String) redisUtil.get(Constants.PREFIX_USER_TOKEN + sysUser.getUserId()));
        redisUtil.set(Constants.PREFIX_USER_SESSION_OBJECT + sysUser.getUserId(), sessionObject, JwtUtil.EXPIRE_TIME);
        return Result.ok(sessionObject);
    }

    @PostMapping(value = "/updatePassword")
    @ApiOperation("用户更新密码")
    public Result updatePassword(@RequestBody SysPasswordForm sysPasswordForm) {
        boolean success = sysUserService.updatePassword(sysPasswordForm);
        if (!success) {
            return Result.error("原密码错误");
        }
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
    public Result resetPassword(@RequestBody SysUser sysUser) {
        sysUserService.resetPassword(sysUser.getUserId());
        return Result.ok();
    }

    @SysLogAuto(value = "导出用户信息")
    @RequiresPermissions("sys:user:export")
    @GetMapping(value = "/export")
    @ApiOperation("导出用户信息")
    public void export(SysUser sysUser, HttpServletResponse response) {
        try {
            IPage<SysUser> page = sysUserService.list(null, sysUser);
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename=SysUserExport.xlsx");
            EasyExcel.write(response.getOutputStream(), SysUser.class).sheet("SysUser").doWrite(page.getRecords());
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
}
