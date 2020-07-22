package com.monezhao.module.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysJob;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.module.sys.service.SysJobService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.quartz.SchedulerException;
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
 * 定时任务Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/job")
@Api(tags = "定时任务")
public class SysJobController extends BaseController {
    @Autowired
    private SysJobService sysJobService;

    /**
     * 自定义查询列表
     *
     * @param sysJob
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:job:list")
    @GetMapping(value = "/list")
    @ApiOperation("定时任务列表")
    public Result list(SysJob sysJob, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysJob> pageList = sysJobService.list(new Page<>(current, size), sysJob);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:job:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("定时任务查询")
    public Result queryById(@RequestParam String id) {
        SysJob sysJob = sysJobService.getById(id);
        return Result.ok(sysJob);
    }

    /**
     * @param sysJob
     * @return
     * @throws SchedulerException
     * @功能：新增
     */
    @RequiresPermissions("sys:job:save")
    @PostMapping(value = "/save")
    @ApiOperation("定时任务新增")
    public Result save(@Valid @RequestBody SysJob sysJob) throws SchedulerException {
        sysJobService.saveJob(sysJob);
        return Result.ok();
    }

    /**
     * @param sysJob
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:job:update")
    @PutMapping(value = "/update")
    @ApiOperation("定时任务修改")
    public Result update(@Valid @RequestBody SysJob sysJob) throws SchedulerException {
        sysJobService.updateJob(sysJob);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @throws SchedulerException
     * @功能：批量删除
     */
    @RequiresPermissions("sys:job:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("定时任务删除")
    public Result delete(@RequestParam String ids) throws SchedulerException {
        sysJobService.delete(ids);
        return Result.ok();
    }

    @RequiresPermissions("sys:job:changeStatus")
    @PutMapping("/changeStatus")
    @ApiOperation("定时任务改变状态")
    public Result changeStatus(@RequestBody SysJob sysJob) throws SchedulerException {
        sysJobService.changeStatus(sysJob.getJobId());
        return Result.ok();
    }

    @RequiresPermissions("sys:job:run")
    @PutMapping("/run")
    @ApiOperation("定时任务运行")
    public Result run(@RequestBody SysJob sysJob) throws SchedulerException {
        sysJobService.run(sysJob.getJobId());
        return Result.ok();
    }
}
