package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysBalanceCount;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysBalanceCountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * 计入总资产Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/balanceCount")
@Api(tags = "计入总资产")
@ApiSupport(author = "monezhao@163.com")
public class SysBalanceCountController extends BaseController {
    @Autowired
    private SysBalanceCountService sysBalanceCountService;

    /**
     * 自定义查询列表
     *
     * @param sysBalanceCount
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:balanceCount:list")
    @GetMapping(value = "/list")
    @ApiOperation("计入总资产列表")
    public Result list(SysBalanceCount sysBalanceCount, @RequestParam Integer current, @RequestParam Integer size) {
        sysBalanceCount.setUserId(ShiroUtils.getUserId());
        IPage<SysBalanceCount> pageList = sysBalanceCountService.list(new Page<>(current, size), sysBalanceCount);
        return Result.ok(pageList);
    }

    //@RequiresPermissions("sys:balanceCount:list")
    //@GetMapping(value = "/queryById")
    //@ApiOperation("计入总资产查询")
    //public Result queryById(@RequestParam String id) {
    //    SysBalanceCount sysBalanceCount = sysBalanceCountService.getById(id);
    //    return Result.ok(sysBalanceCount);
    //}
    //
    ///**
    // * @功能：新增
    // * @param sysBalanceCount
    // * @return
    // */
    //@RequiresPermissions("sys:balanceCount:save")
    //@PostMapping(value = "/save")
    //@ApiOperation("计入总资产新增")
    //@SysLogAuto(value = "计入总资产新增")
    //@ApiOperationSupport(ignoreParameters = {
    //        "balanceCountId",
    //})
    //public Result save(@Valid @RequestBody SysBalanceCount sysBalanceCount) {
    //    sysBalanceCountService.save(sysBalanceCount);
    //    return Result.ok();
    //}

    /**
     * @功能：修改
     * @param sysBalanceCount
     * @return
     */
    @RequiresPermissions("sys:balanceCount:update")
    @PutMapping(value = "/update")
    @ApiOperation("计入总资产修改")
    @SysLogAuto(value = "计入总资产修改")
    public Result update(@Valid @RequestBody SysBalanceCount sysBalanceCount) {
        if (sysBalanceCount.getBalanceCountId() == null) {
            sysBalanceCount.setUserId(ShiroUtils.getUserId());
        }
        sysBalanceCountService.saveOrUpdate(sysBalanceCount);
        return Result.ok();
    }
    //
    ///**
    // * @功能：批量删除
    // * @param ids
    // * @return
    // */
    //@RequiresPermissions("sys:balanceCount:delete")
    //@DeleteMapping(value = "/delete")
    //@ApiOperation("计入总资产删除")
    //@SysLogAuto(value = "计入总资产删除")
    //public Result delete(@RequestParam String ids) {
    //    if (ids == null || ids.trim().length() == 0) {
    //        return Result.error("ids can't be empty");
    //    }
    //    String[] idsArr = ids.split(",");
    //    if (idsArr.length > 1) {
    //        sysBalanceCountService.removeByIds(Arrays.asList(idsArr));
    //    } else {
    //        sysBalanceCountService.removeById(idsArr[0]);
    //    }
    //    return Result.ok();
    //}
}
