package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysJobLog;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.SysJobLogService;
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
 * 定时任务执行日志Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/jobLog")
@Api(tags = "定时任务执行日志")
public class SysJobLogController extends BaseController {
    @Autowired
    private SysJobLogService sysJobLogService;

    /**
     * 自定义查询列表
     *
     * @param sysJobLog
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:jobLog:list")
    @GetMapping(value = "/list")
    @ApiOperation("定时任务执行日志列表")
    public Result list(SysJobLog sysJobLog, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysJobLog> pageList = sysJobLogService.list(new Page<>(current, size), sysJobLog);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:jobLog:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("定时任务执行日志查询")
    public Result queryById(@RequestParam String id) {
        SysJobLog sysJobLog = sysJobLogService.getById(id);
        return Result.ok(sysJobLog);
    }

    /**
     * @param sysJobLog
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:jobLog:save")
    @PostMapping(value = "/save")
    @ApiOperation("定时任务执行日志新增")
    public Result save(@Valid @RequestBody SysJobLog sysJobLog) {
        sysJobLogService.save(sysJobLog);
        return Result.ok();
    }

    /**
     * @param sysJobLog
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:jobLog:update")
    @PutMapping(value = "/update")
    @ApiOperation("定时任务执行日志修改")
    public Result update(@Valid @RequestBody SysJobLog sysJobLog) {
        sysJobLogService.updateById(sysJobLog);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:jobLog:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("定时任务执行日志删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysJobLogService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysJobLogService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}