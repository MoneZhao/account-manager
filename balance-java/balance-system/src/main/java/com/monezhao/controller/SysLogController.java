package com.monezhao.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CustomCellWriteHandler;
import com.monezhao.service.SysLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Arrays;

/**
 * 系统日志Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/log")
@Api(tags = "系统日志")
@ApiSupport(author = "monezhao@163.com")
public class SysLogController extends BaseController {
    @Autowired
    private SysLogService sysLogService;

    @Autowired
    private DataSourceTransactionManager dataSourceTransactionManager;

    @Autowired
    private TransactionDefinition transactionDefinition;

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
    @SysLogAuto(value = "系统日志新增")
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
    @SysLogAuto(value = "系统日志修改")
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
    @SysLogAuto(value = "系统日志删除")
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

    /**
     * 日志excel 文件上传
     *
     * @param request
     * @return
     */
    @SysLogAuto(value = "日志文件上传")
    @PostMapping(value = "/import")
    @RequiresPermissions("sys:log:import")
    @ApiOperation("日志文件上传")
    public Result doImport(HttpServletRequest request) throws IOException {
        if (!(request instanceof MultipartHttpServletRequest)) {
            throw new IllegalArgumentException("上传文件请求格式错误");
        }
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        if (multipartRequest.getFileMap().size() == 0) {
            throw new IllegalArgumentException("上传文件为空");
        }
        MultipartFile file = multipartRequest.getFileMap().values().iterator().next();
        sysLogService.importManager(file);
        return Result.ok("后台处理中, 稍后查询列表");
    }

    /**
     * @功能：导出全部日志
     */
    @SysLogAuto(value = "导出全部日志")
    @RequiresPermissions("sys:log:export")
    @GetMapping(value = "/export")
    @ApiOperation("导出全部账户余额")
    public void export(HttpServletResponse response) {
        try {
            IPage<SysLog> page = sysLogService.list(null, new SysLog());
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename=SysLogExportAll.xlsx");
            ExcelWriter excelWriter = EasyExcel.write(response.getOutputStream())
                    .registerWriteHandler(new CustomCellWriteHandler()).build();

            WriteSheet writeSheet = EasyExcel.writerSheet(0, "日志").head(SysLog.class).build();
            excelWriter.write(page.getRecords(), writeSheet);

            excelWriter.finish();
        } catch (Exception e) {
            throw new SysException("下载文件失败：" + e.getMessage());
        }
    }
}
