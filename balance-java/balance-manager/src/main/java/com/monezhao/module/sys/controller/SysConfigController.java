package com.monezhao.module.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysConfig;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.module.sys.service.SysConfigService;
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

/**
 * 系统参数Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/config")
@Api(tags = "系统参数")
public class SysConfigController extends BaseController {
    @Autowired
    private SysConfigService sysConfigService;

    /**
     * 自定义查询列表
     *
     * @param sysConfig
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:config:list")
    @GetMapping(value = "/list")
    @ApiOperation("系统参数列表")
    public Result list(SysConfig sysConfig, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysConfig> pageList = sysConfigService.list(new Page<>(current, size), sysConfig);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:config:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("系统参数查询")
    public Result queryById(@RequestParam String id) {
        SysConfig sysConfig = sysConfigService.getById(id);
        return Result.ok(sysConfig);
    }

    /**
     * @param sysConfig
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增系统参数")
    @RequiresPermissions("sys:config:save")
    @PostMapping(value = "/save")
    @ApiOperation("系统参数新增")
    public Result save(@Valid @RequestBody SysConfig sysConfig) {
        sysConfigService.saveSysConfig(sysConfig);
        return Result.ok();
    }

    /**
     * @param sysConfig
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改系统参数")
    @RequiresPermissions("sys:config:update")
    @PutMapping(value = "/update")
    @ApiOperation("系统参数修改")
    public Result update(@Valid @RequestBody SysConfig sysConfig) {
        sysConfigService.updateSysConfig(sysConfig);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除系统参数")
    @RequiresPermissions("sys:config:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("系统参数删除")
    public Result delete(@RequestParam String ids) {
        sysConfigService.deleteSysConfig(ids);
        return Result.ok();
    }
}
