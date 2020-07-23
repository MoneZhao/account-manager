package com.monezhao.module.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysRoleUser;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.module.sys.service.SysRoleUserService;
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

import javax.validation.Valid;
import java.util.Arrays;

/**
 * 角色和用户关系Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/roleUser")
@Api(tags = "角色和用户关系")
public class SysRoleUserController extends BaseController {
    @Autowired
    private SysRoleUserService sysRoleUserService;

    /**
     * 自定义查询列表
     *
     * @param sysRoleUser
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:roleUser:list")
    @GetMapping(value = "/list")
    @ApiOperation("角色和用户关系列表")
    public Result list(SysRoleUser sysRoleUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysRoleUser> pageList = sysRoleUserService.list(new Page<>(current, size), sysRoleUser);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:roleUser:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("角色和用户关系查询")
    public Result queryById(@RequestParam String id) {
        SysRoleUser sysRoleUser = sysRoleUserService.getById(id);
        return Result.ok(sysRoleUser);
    }

    /**
     * @param sysRoleUser
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:roleUser:save")
    @PostMapping(value = "/save")
    @SysLogAuto(value = "角色和用户关系新增")
    @ApiOperation("角色和用户关系新增")
    public Result save(@Valid @RequestBody SysRoleUser sysRoleUser) {
        sysRoleUserService.save(sysRoleUser);
        return Result.ok();
    }

    /**
     * @param sysRoleUser
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:roleUser:update")
    @PutMapping(value = "/update")
    @SysLogAuto(value = "角色和用户关系修改")
    @ApiOperation("角色和用户关系修改")
    public Result update(@Valid @RequestBody SysRoleUser sysRoleUser) {
        sysRoleUserService.updateById(sysRoleUser);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:roleUser:delete")
    @DeleteMapping(value = "/delete")
    @SysLogAuto(value = "角色和用户关系删除")
    @ApiOperation("角色和用户关系删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysRoleUserService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysRoleUserService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
