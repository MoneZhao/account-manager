package com.monezhao.module.balance.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.read.metadata.ReadSheet;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.YearMonthDayStartAndEnd;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CustomCellWriteHandler;
import com.monezhao.common.util.DateTimeUtil;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.excel.UploadSysBalanceDetailListener;
import com.monezhao.excel.UploadSysBalanceMainListener;
import com.monezhao.module.balance.service.SysBalanceDetailService;
import com.monezhao.module.balance.service.SysBalanceMainService;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
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

    @Autowired
    private SysBalanceDetailService sysBalanceDetailService;

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
    @ApiOperationSupport(ignoreParameters = {
            "balanceMainId",
    })
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
        sysBalanceDetailService.deleteMain(Arrays.asList(idsArr));
        return Result.ok();
    }

    /**
     * @param sysBalanceMain
     * @return
     * @功能：账户余额对比
     */
    @PostMapping(value = "/compare")
    @ApiOperation("账户余额对比")
    @SysLogAuto(value = "账户余额对比")
    @ApiOperationSupport(ignoreParameters = {
            "balanceMainId",
            "account",
            "userId",
            "remark",
            "deleteType",
    })
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

    /**
     * @param sysBalanceMain
     * @return
     * @功能：导出全部账户余额
     */
    @SysLogAuto(value = "导出全部账户余额")
    @RequiresPermissions("sys:balanceMain:export")
    @GetMapping(value = "/exportAll")
    @ApiOperation("导出全部账户余额")
    @ApiOperationSupport(ignoreParameters = {
            "balanceMainId",
            "account",
            "accountDate",
            "remark",
            "deleteType",
    })
    public void exportAll(SysBalanceMain sysBalanceMain, HttpServletResponse response) {
        try {
            SysUser sysUser = ShiroUtils.getSysUser();
            sysBalanceMain.setUserId(sysUser.getUserId());
            SysBalanceDetail sysBalanceDetail = new SysBalanceDetail();
            sysBalanceDetail.setUserId(sysUser.getUserId());
            IPage<SysBalanceMain> page = sysBalanceMainService.list(null, sysBalanceMain);
            IPage<SysBalanceDetail> pageDetail = sysBalanceDetailService.list(null, sysBalanceDetail);
            Collections.reverse(page.getRecords());
            Collections.reverse(pageDetail.getRecords());
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename=SysBalanceMainExportAll.xlsx");
//            EasyExcel.write(response.getOutputStream(), SysBalanceMain.class)
//                    .registerWriteHandler(new CustomCellWriteHandler())
//                    .sheet(0 ,"账户余额").doWrite(page.getRecords())
//            ;
            ExcelWriter excelWriter = EasyExcel.write(response.getOutputStream())
                    .registerWriteHandler(new CustomCellWriteHandler()).build();

            WriteSheet writeSheet = EasyExcel.writerSheet(0, "账户余额").head(SysBalanceMain.class).build();
            excelWriter.write(page.getRecords(), writeSheet);

            writeSheet = EasyExcel.writerSheet(1, "账户明细").head(SysBalanceDetail.class).build();
            excelWriter.write(pageDetail.getRecords(), writeSheet);

            excelWriter.finish();
        } catch (Exception e) {
            throw new SysException("下载文件失败：" + e.getMessage());
        }
    }

    /**
     * @param sysBalanceMain
     * @return
     * @功能：导出当前页面账户余额
     */
    @SysLogAuto(value = "导出当前页面账户余额")
    @RequiresPermissions("sys:balanceMain:export")
    @GetMapping(value = "/export")
    @ApiOperation("导出当前页面账户余额")
    @ApiOperationSupport(ignoreParameters = {
            "sysBalanceMain.balanceMainId",
            "sysBalanceMain.account",
            "sysBalanceMain.accountDate",
            "sysBalanceMain.remark",
            "sysBalanceMain.deleteType",
    })
    public void export(SysBalanceMain sysBalanceMain, @RequestParam Integer current, @RequestParam Integer size,
                       HttpServletResponse response) {
        try {
            SysUser sysUser = ShiroUtils.getSysUser();
            sysBalanceMain.setUserId(sysUser.getUserId());
            IPage<SysBalanceMain> page = sysBalanceMainService.list(new Page<>(current, size), sysBalanceMain);
            List<String> mainIds = page.getRecords().parallelStream()
                    .map(SysBalanceMain::getBalanceMainId).collect(Collectors.toList());
            List<SysBalanceDetail> pageDetail = sysBalanceDetailService.list(mainIds, sysUser.getUserId());
            Collections.reverse(page.getRecords());
            Collections.reverse(pageDetail);
            response.setContentType("application/vnd.ms-excel");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment;filename=SysBalanceMainExportCur.xlsx");
//            EasyExcel.write(response.getOutputStream(), SysBalanceMain.class)
//                    .registerWriteHandler(new CustomCellWriteHandler())
//                    .sheet("SysBalanceMain").doWrite(page.getRecords());
            ExcelWriter excelWriter = EasyExcel.write(response.getOutputStream())
                    .registerWriteHandler(new CustomCellWriteHandler()).build();

            WriteSheet writeSheet = EasyExcel.writerSheet(0, "账户余额").head(SysBalanceMain.class).build();
            excelWriter.write(page.getRecords(), writeSheet);

            writeSheet = EasyExcel.writerSheet(1, "账户明细").head(SysBalanceDetail.class).build();
            excelWriter.write(pageDetail, writeSheet);

            excelWriter.finish();
        } catch (Exception e) {
            throw new SysException("下载文件失败：" + e.getMessage());
        }
    }

    /**
     * 账户余额excel 文件上传
     *
     * @param request
     * @return
     */
    @SysLogAuto(value = "账户余额文件上传")
    @PostMapping(value = "/import")
    @RequiresPermissions("sys:balanceMain:import")
    @ApiOperation("账户余额文件上传")
    public Result doImport(HttpServletRequest request) throws IOException {
        if (!(request instanceof MultipartHttpServletRequest)) {
            throw new IllegalArgumentException("上传文件请求格式错误");
        }
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        if (multipartRequest.getFileMap().size() == 0) {
            throw new IllegalArgumentException("上传文件为空");
        }
        MultipartFile file = multipartRequest.getFileMap().values().iterator().next();
//        EasyExcel.read(file.getInputStream(), SysBalanceMain.class,
//                new UploadSysBalanceMainListener(sysBalanceDetailService)).sheet().doRead();
        ExcelReader excelReader = EasyExcel.read(file.getInputStream()).build();
        ReadSheet readSheet1 = EasyExcel.readSheet(0).head(SysBalanceMain.class).
                registerReadListener(new UploadSysBalanceMainListener(sysBalanceMainService)).build();
        ReadSheet readSheet2 = EasyExcel.readSheet(1).head(SysBalanceDetail.class).
                registerReadListener(new UploadSysBalanceDetailListener(sysBalanceDetailService)).build();
        excelReader.read(readSheet1, readSheet2);
        excelReader.finish();
        return Result.ok();
    }
}
