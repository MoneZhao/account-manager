package com.monezhao.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysRole;
import com.monezhao.bean.sys.SysRolePermission;
import com.monezhao.bean.sys.SysRoleUser;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysRoleService;
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
import java.util.List;
import java.util.Map;

/**
 * 角色Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/role")
@Api(tags = "角色")
public class SysRoleController extends BaseController {
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 自定义查询列表
     *
     * @param sysRole
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:role:list")
    @GetMapping(value = "/list")
    @ApiOperation("角色列表")
    public Result list(SysRole sysRole, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysRole> pageList = sysRoleService.list(new Page<>(current, size), sysRole);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:role:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("角色查询")
    public Result queryById(@RequestParam String id) {
        SysRole sysRole = sysRoleService.getById(id);
        return Result.ok(sysRole);
    }

    /**
     * @param sysRole
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增角色")
    @RequiresPermissions("sys:role:save")
    @PostMapping(value = "/save")
    @ApiOperation("角色新增")
    public Result save(@Valid @RequestBody SysRole sysRole) {
        sysRoleService.save(sysRole);
        return Result.ok();
    }

    /**
     * @param sysRole
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改角色")
    @RequiresPermissions("sys:role:update")
    @PutMapping(value = "/update")
    @ApiOperation("角色修改")
    public Result update(@Valid @RequestBody SysRole sysRole) {
        sysRoleService.updateById(sysRole);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除角色")
    @RequiresPermissions("sys:role:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("角色删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        this.sysRoleService.delete(ids);
        return Result.ok();
    }

    /**
     * 查询角色权限
     *
     * @param roleId
     * @return
     */
    @RequiresPermissions("sys:role:getRolePermissions")
    @GetMapping(value = "/getRolePermissions")
    @ApiOperation("角色权限查询")
    public Result getRolePermissions(String roleId) {
        SysUser sysUser = ShiroUtils.getSysUser();
        Map<String, Object> data = this.sysRoleService.getRolePermissions(sysUser, roleId);
        return Result.ok(data);
    }

    /**
     * 保存角色权限
     *
     * @param sysRolePermission
     * @return
     */
    @SysLogAuto(value = "保存角色权限")
    @RequiresPermissions("sys:role:saveRolePermissions")
    @PostMapping(value = "/saveRolePermissions")
    @ApiOperation("角色权限保存")
    public Result saveRolePermissions(@RequestBody SysRolePermission sysRolePermission) {
        this.sysRoleService.saveRolePermissions(sysRolePermission.getRoleId(), sysRolePermission.getMenuOrFuncId(),
                sysRolePermission.getPermissionType());
        return Result.ok();
    }

    /**
     * 获取角色用户
     *
     * @param sysRoleUser
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:role:getRoleUser")
    @GetMapping(value = "/getRoleUser")
    @ApiOperation("角色用户查询")
    public Result getRoleUser(SysRoleUser sysRoleUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysUser> pageList = this.sysRoleService.getRoleUser(new Page<>(current, size), sysRoleUser);
        return Result.ok(pageList);
    }

    /**
     * 保存角色用户
     *
     * @param sysRoleUser
     * @return
     */
    @SysLogAuto(value = "保存角色用户")
    @RequiresPermissions("sys:role:saveRoleUsers")
    @PostMapping(value = "/saveRoleUsers")
    @ApiOperation("角色用户保存")
    public Result saveRoleUsers(@RequestBody SysRoleUser sysRoleUser) {
        this.sysRoleService.saveRoleUsers(sysRoleUser.getRoleId(), sysRoleUser.getUserId());
        return Result.ok();
    }

    /**
     * 删除角色用户
     *
     * @param roleId
     * @param userIds
     * @return
     */
    @SysLogAuto(value = "删除角色用户")
    @RequiresPermissions("sys:role:deleteRoleUsers")
    @DeleteMapping(value = "/deleteRoleUsers")
    @ApiOperation("角色用户删除")
    public Result deleteRoleUsers(String roleId, String userIds) {
        this.sysRoleService.deleteRoleUsers(roleId, userIds);
        return Result.ok();
    }

    /**
     * 查询所有角色
     *
     * @return
     */
    @RequiresPermissions("sys:role:listAll")
    @GetMapping(value = "/listAll")
    @ApiOperation("所有角色查询")
    public Result listAll() {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        List<SysRole> roles = sysRoleService.list(queryWrapper.orderByAsc("sort_no"));
        return Result.ok(roles);
    }
}
