package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysCodeType;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.SysCodeTypeService;
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
 * 代码类别Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/codeType")
@Api(tags = "代码类别")
@ApiSupport(author = "monezhao@163.com")
public class SysCodeTypeController extends BaseController {
    @Autowired
    private SysCodeTypeService sysCodeTypeService;

    /**
     * 自定义查询列表
     *
     * @param sysCodeType
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:codeType:list")
    @GetMapping(value = "/list")
    @ApiOperation("代码类别列表")
    public Result list(SysCodeType sysCodeType, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysCodeType> pageList = sysCodeTypeService.list(new Page<>(current, size), sysCodeType);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:codeType:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("代码类别查询")
    public Result queryById(@RequestParam String id) {
        SysCodeType sysCodeType = sysCodeTypeService.getById(id);
        return Result.ok(sysCodeType);
    }

    /**
     * @param sysCodeType
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增代码类别")
    @RequiresPermissions("sys:codeType:save")
    @PostMapping(value = "/save")
    @ApiOperation("代码类别新增")
    @ApiOperationSupport(ignoreParameters = {
            "codeTypeId",
    })
    public Result save(@Valid @RequestBody SysCodeType sysCodeType) {
        sysCodeTypeService.save(sysCodeType);
        return Result.ok();
    }

    /**
     * @param sysCodeType
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改代码类别")
    @RequiresPermissions("sys:codeType:update")
    @PutMapping(value = "/update")
    @ApiOperation("代码类别修改")
    public Result update(@Valid @RequestBody SysCodeType sysCodeType) {
        sysCodeTypeService.updateById(sysCodeType);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除代码类别")
    @RequiresPermissions("sys:codeType:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("代码类别删除")
    public Result delete(@RequestParam String ids) {
        sysCodeTypeService.deleteSysCodeType(ids);
        return Result.ok();
    }

    /**
     * 刷新缓存数据
     * @功能：刷新缓存数据
     */
    @SysLogAuto(value = "刷新数据字典缓存数据")
    @RequiresPermissions("sys:codeType:save")
    @PostMapping(value = "/flush")
    @ApiOperation("刷新缓存数据")
    public Result flush() {
        sysCodeTypeService.flush();
        return Result.ok();
    }
}
