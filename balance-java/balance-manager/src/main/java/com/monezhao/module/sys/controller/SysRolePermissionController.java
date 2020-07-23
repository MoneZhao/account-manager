package com.monezhao.module.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysRolePermission;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.module.sys.service.SysRolePermissionService;
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
 * 操作权限Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/rolePermission")
@Api(tags = "操作权限")
public class SysRolePermissionController extends BaseController {
    @Autowired
    private SysRolePermissionService sysRolePermissionService;

    /**
     * 自定义查询列表
     *
     * @param sysRolePermission
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:rolePermission:list")
    @GetMapping(value = "/list")
    @ApiOperation("操作权限列表")
    public Result list(SysRolePermission sysRolePermission, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysRolePermission> pageList = sysRolePermissionService.list(new Page<>(current, size), sysRolePermission);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:rolePermission:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("操作权限查询")
    public Result queryById(@RequestParam String id) {
        SysRolePermission sysRolePermission = sysRolePermissionService.getById(id);
        return Result.ok(sysRolePermission);
    }

    /**
     * @param sysRolePermission
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:rolePermission:save")
    @PostMapping(value = "/save")
    @SysLogAuto(value = "操作权限新增")
    @ApiOperation("操作权限新增")
    public Result save(@Valid @RequestBody SysRolePermission sysRolePermission) {
        sysRolePermissionService.save(sysRolePermission);
        return Result.ok();
    }

    /**
     * @param sysRolePermission
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:rolePermission:update")
    @PutMapping(value = "/update")
    @SysLogAuto(value = "操作权限修改")
    @ApiOperation("操作权限修改")
    public Result update(@Valid @RequestBody SysRolePermission sysRolePermission) {
        sysRolePermissionService.updateById(sysRolePermission);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:rolePermission:delete")
    @DeleteMapping(value = "/delete")
    @SysLogAuto(value = "操作权限删除")
    @ApiOperation("操作权限删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysRolePermissionService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysRolePermissionService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
