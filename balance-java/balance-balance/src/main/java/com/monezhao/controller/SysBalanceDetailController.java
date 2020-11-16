package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.SysBalanceDetailService;
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
 * 账户明细Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/balanceDetail")
@Api(tags = "账户明细")
@ApiSupport(author = "monezhao@163.com")
public class SysBalanceDetailController extends BaseController {
    @Autowired
    private SysBalanceDetailService sysBalanceDetailService;

    /**
     * 自定义查询列表
     *
     * @param sysBalanceDetail
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:balanceMain:list")
    @GetMapping(value = "/list")
    @ApiOperation("账户明细列表")
    public Result list(SysBalanceDetail sysBalanceDetail, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysBalanceDetail> pageList = sysBalanceDetailService.list(new Page<>(current, size), sysBalanceDetail);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:balanceMain:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("账户明细查询")
    public Result queryById(@RequestParam String id) {
        SysBalanceDetail sysBalanceDetail = sysBalanceDetailService.getById(id);
        return Result.ok(sysBalanceDetail);
    }

    /**
     * @param sysBalanceDetail
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:balanceMain:save")
    @PostMapping(value = "/save")
    @SysLogAuto(value = "新增账户明细")
    @ApiOperation("账户明细新增")
    @ApiOperationSupport(ignoreParameters = {
            "balanceDetailId",
    })
    public Result save(@Valid @RequestBody SysBalanceDetail sysBalanceDetail) {
        sysBalanceDetailService.save(sysBalanceDetail);
        return Result.ok();
    }

    /**
     * @param sysBalanceDetail
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:balanceMain:update")
    @PutMapping(value = "/update")
    @SysLogAuto(value = "修改账户明细")
    @ApiOperation("账户明细修改")
    public Result update(@Valid @RequestBody SysBalanceDetail sysBalanceDetail) {
        sysBalanceDetailService.update(sysBalanceDetail);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:balanceMain:delete")
    @DeleteMapping(value = "/delete")
    @SysLogAuto(value = "删除账户明细")
    @ApiOperation("账户明细删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        sysBalanceDetailService.delete(idsArr);
        return Result.ok();
    }
}
