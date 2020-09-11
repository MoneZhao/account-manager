package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysFunc;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.SysFuncService;
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
 * 功能Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/func")
@Api(tags = "功能")
public class SysFuncController extends BaseController {
    @Autowired
    private SysFuncService sysFuncService;

    /**
     * 自定义查询列表
     *
     * @param sysFunc
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:func:list")
    @GetMapping(value = "/list")
    @ApiOperation("功能列表")
    public Result list(SysFunc sysFunc, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysFunc> pageList = sysFuncService.list(new Page<>(current, size), sysFunc);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:func:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("功能查询")
    public Result queryById(@RequestParam String id) {
        SysFunc sysFunc = sysFuncService.getById(id);
        return Result.ok(sysFunc);
    }

    /**
     * @param sysFunc
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增功能按钮")
    @RequiresPermissions("sys:func:save")
    @PostMapping(value = "/save")
    @ApiOperation("功能新增")
    @ApiOperationSupport(ignoreParameters = {
            "funcId",
    })
    public Result save(@Valid @RequestBody SysFunc sysFunc) {
        sysFuncService.save(sysFunc);
        return Result.ok();
    }

    /**
     * @param sysFunc
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改功能按钮")
    @RequiresPermissions("sys:func:update")
    @PutMapping(value = "/update")
    @ApiOperation("功能修改")
    public Result update(@Valid @RequestBody SysFunc sysFunc) {
        sysFuncService.updateById(sysFunc);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除功能按钮")
    @RequiresPermissions("sys:func:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("功能删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysFuncService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysFuncService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
