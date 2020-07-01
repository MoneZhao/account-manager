package com.monezhao.modules.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.modules.sys.service.SysLogService;
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
 * 系统日志Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/log")
@Api(tags = "系统日志")
public class SysLogController extends BaseController {
    @Autowired
    private SysLogService sysLogService;

    /**
     * 自定义查询列表
     *
     * @param sysLog
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:log:list")
    @GetMapping(value = "/list")
    @ApiOperation("系统日志列表")
    public Result list(SysLog sysLog, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysLog> pageList = sysLogService.list(new Page<>(current, size), sysLog);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:log:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("系统日志查询")
    public Result queryById(@RequestParam String id) {
        SysLog sysLog = sysLogService.getById(id);
        return Result.ok(sysLog);
    }

    /**
     * @param sysLog
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:log:save")
    @PostMapping(value = "/save")
    @ApiOperation("系统日志新增")
    public Result save(@Valid @RequestBody SysLog sysLog) {
        sysLogService.save(sysLog);
        return Result.ok();
    }

    /**
     * @param sysLog
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:log:update")
    @PutMapping(value = "/update")
    @ApiOperation("系统日志修改")
    public Result update(@Valid @RequestBody SysLog sysLog) {
        sysLogService.updateById(sysLog);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:log:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("系统日志删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysLogService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysLogService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
