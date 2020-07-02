package com.monezhao.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.YearMonthDayStartAndEnd;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.util.DateTimeUtil;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysBalanceMainService;
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
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 账户余额主Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/balanceMain")
@Api(tags = "账户余额")
public class SysBalanceMainController extends BaseController {
    @Autowired
    private SysBalanceMainService sysBalanceMainService;

    /**
     * 自定义查询列表
     *
     * @param sysBalanceMain
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:balanceMain:list")
    @GetMapping(value = "/list")
    @ApiOperation("账户余额列表")
    public Result list(SysBalanceMain sysBalanceMain, @RequestParam Integer current, @RequestParam Integer size) {
        SysUser sysUser = ShiroUtils.getSysUser();
        sysBalanceMain.setUserId(sysUser.getUserId());
        IPage<SysBalanceMain> pageList = sysBalanceMainService.list(new Page<>(current, size), sysBalanceMain);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:balanceMain:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("账户余额查询")
    public Result queryById(@RequestParam String id) {
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(id);
        return Result.ok(sysBalanceMain);
    }

    /**
     * @param sysBalanceMain
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:balanceMain:save")
    @PostMapping(value = "/save")
    @SysLogAuto(value = "新增账户余额")
    @ApiOperation("账户余额新增")
    public Result save(@Valid @RequestBody SysBalanceMain sysBalanceMain) {
        SysUser sysUser = ShiroUtils.getSysUser();
        sysBalanceMain.setUserId(sysUser.getUserId());
        sysBalanceMainService.save(sysBalanceMain);
        return Result.ok();
    }

    /**
     * @param sysBalanceMain
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:balanceMain:update")
    @PutMapping(value = "/update")
    @SysLogAuto(value = "修改账户余额")
    @ApiOperation("账户余额修改")
    public Result update(@Valid @RequestBody SysBalanceMain sysBalanceMain) {
        SysUser sysUser = ShiroUtils.getSysUser();
        sysBalanceMain.setUserId(sysUser.getUserId());
        sysBalanceMainService.updateById(sysBalanceMain);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:balanceMain:delete")
    @DeleteMapping(value = "/delete")
    @SysLogAuto(value = "删除账户余额")
    @ApiOperation("账户余额删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        sysBalanceMainService.delete(Arrays.asList(idsArr));
        return Result.ok();
    }

    /**
     * @param sysBalanceMain
     * @return
     * @功能：账户余额对比
     */
    @PostMapping(value = "/compare")
    @ApiOperation("账户余额对比")
    public Result compare(@RequestBody SysBalanceMain sysBalanceMain) {
        if (sysBalanceMain.getAccountDate() == null) {
            return Result.error("请输入对比日期");
        }
        QueryWrapper<SysBalanceMain> queryWrapper = new QueryWrapper<>();
        String userId = ShiroUtils.getUserId();
        Date date = sysBalanceMain.getAccountDate();
        queryWrapper.eq("user_id", userId).eq("account_date", date);
        sysBalanceMain = sysBalanceMainService.getOne(queryWrapper);
        if (Objects.isNull(sysBalanceMain)) {
            YearMonthDayStartAndEnd startAndEnd =
                    DateTimeUtil.dateToYearMonthDayStartAndEnd(date);
            queryWrapper = new QueryWrapper<>();
            queryWrapper
                    .eq("user_id", userId)
                    .between("account_date", startAndEnd.getFirstDayOfMonth(), startAndEnd.getLastDayOfMonth());
            List<SysBalanceMain> list = sysBalanceMainService.list(queryWrapper);
            if (list.size() == 0) {
                return Result.error("对比月份无记录");
            } else {
                return Result.ok("当前日期无记录, 可选择以下日期" +
                        list.stream()
                                .map(vo -> DateUtil.dateToStr(vo.getAccountDate()))
                                .collect(Collectors.joining(", ", "[", "]"))
                );
            }
        } else {
            return Result.ok("查询成功", sysBalanceMain);
        }
    }
}
