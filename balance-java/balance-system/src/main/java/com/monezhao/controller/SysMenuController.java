package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysMenu;
import com.monezhao.bean.utilsVo.ElTree;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.SysMenuService;
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

/**
 * 菜单Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/menu")
@Api(tags = "菜单")
@ApiSupport(author = "monezhao@163.com")
public class SysMenuController extends BaseController {
    @Autowired
    private SysMenuService sysMenuService;

    /**
     * 自定义查询列表
     *
     * @param sysMenu
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:menu:list")
    @GetMapping(value = "/list")
    @ApiOperation("菜单列表")
    public Result list(SysMenu sysMenu, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysMenu> pageList = sysMenuService.list(new Page<>(current, size), sysMenu);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:menu:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("菜单查询")
    public Result queryById(@RequestParam String id) {
        SysMenu sysMenu = sysMenuService.getById(id);
        return Result.ok(sysMenu);
    }

    /**
     * @param sysMenu
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增功能菜单")
    @RequiresPermissions("sys:menu:save")
    @PostMapping(value = "/save")
    @ApiOperation("菜单新增")
    @ApiOperationSupport(ignoreParameters = {
            "menuId",
    })
    public Result save(@Valid @RequestBody SysMenu sysMenu) {
        sysMenuService.saveSysMenu(sysMenu);
        return Result.ok(sysMenu);
    }

    /**
     * @param sysMenu
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改功能菜单")
    @RequiresPermissions("sys:menu:update")
    @PutMapping(value = "/update")
    @ApiOperation("菜单修改")
    public Result update(@Valid @RequestBody SysMenu sysMenu) {
        sysMenuService.updateSysMenu(sysMenu);
        return Result.ok(sysMenu);
    }

    /**
     * @param id
     * @return
     * @功能：删除
     */
    @SysLogAuto(value = "删除功能菜单")
    @RequiresPermissions("sys:menu:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("菜单删除")
    public Result delete(@RequestParam String id) {
        sysMenuService.delete(id);
        return Result.ok();
    }

    /**
     * 菜单管理，菜单树数据
     *
     * @return
     */
    @RequiresPermissions("sys:menu:getTreeData")
    @GetMapping(value = "/getTreeData")
    @ApiOperation("菜单树数据")
    public Result getTreeData() {
        List<ElTree> treeData = sysMenuService.getTreeData();
        return Result.ok(treeData);
    }
}
