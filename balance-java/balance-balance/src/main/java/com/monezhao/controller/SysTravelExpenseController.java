package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysTravelExpense;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.util.DateUtil;
import com.monezhao.service.SysTravelExpenseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;

/**
 * 出差报销Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/travelExpense")
@Api(tags = "出差报销")
@ApiSupport(author = "monezhao@163.com")
public class SysTravelExpenseController extends BaseController {
    @Autowired
    private SysTravelExpenseService sysTravelExpenseService;

    /**
     * 自定义查询列表
     *
     * @param sysTravelExpense
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:travelExpense:list")
    @GetMapping(value = "/list")
    @ApiOperation("出差报销列表")
    public Result list(SysTravelExpense sysTravelExpense, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysTravelExpense> pageList = sysTravelExpenseService.list(new Page<>(current, size), sysTravelExpense);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:travelExpense:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("出差报销查询")
    public Result queryById(@RequestParam String id) {
        SysTravelExpense sysTravelExpense = sysTravelExpenseService.getById(id);
        return Result.ok(sysTravelExpense);
    }

    /**
     * @功能：新增
     * @param sysTravelExpense
     * @return
     */
    @RequiresPermissions("sys:travelExpense:save")
    @PostMapping(value = "/save")
    @ApiOperation("出差报销新增")
    @SysLogAuto(value = "出差报销新增")
    @ApiOperationSupport(ignoreParameters = {
            "travelExpenseId",
    })
    public Result save(@Valid @RequestBody SysTravelExpense sysTravelExpense) {
        if (sysTravelExpense.getGetDate() != null) {
            sysTravelExpense.setUseDay(Math.abs(
                    DateUtil.getDateDiff(
                        sysTravelExpense.getRequestDate(),
                        sysTravelExpense.getGetDate()
                    )
            ));
        }
        if (sysTravelExpense.getGetNumber() != null) {
            sysTravelExpense.setAddNumber(
                    sysTravelExpense.getGetNumber().subtract(
                            sysTravelExpense.getUseNumber()
                    ).abs()
            );
        }
        sysTravelExpenseService.save(sysTravelExpense);
        return Result.ok();
    }

    /**
     * @功能：修改
     * @param sysTravelExpense
     * @return
     */
    @RequiresPermissions("sys:travelExpense:update")
    @PutMapping(value = "/update")
    @ApiOperation("出差报销修改")
    @SysLogAuto(value = "出差报销修改")
    public Result update(@Valid @RequestBody SysTravelExpense sysTravelExpense) {
        if (sysTravelExpense.getGetDate() != null) {
            sysTravelExpense.setUseDay(Math.abs(
                    DateUtil.getDateDiff(
                            sysTravelExpense.getRequestDate(),
                            sysTravelExpense.getGetDate()
                    )
            ));
        }
        if (sysTravelExpense.getGetNumber() != null) {
            sysTravelExpense.setAddNumber(
                    sysTravelExpense.getGetNumber().subtract(
                            sysTravelExpense.getUseNumber()
                    ).abs()
            );
        }
        sysTravelExpenseService.updateById(sysTravelExpense);
        return Result.ok();
    }

    /**
     * @功能：批量删除
     * @param ids
     * @return
     */
    @RequiresPermissions("sys:travelExpense:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("出差报销删除")
    @SysLogAuto(value = "出差报销删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysTravelExpenseService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysTravelExpenseService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
