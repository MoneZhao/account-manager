package vip.xiaonuo.biz.modular.balancemain.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.date.DateUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vip.xiaonuo.biz.core.util.DateTimeUtil;
import vip.xiaonuo.biz.core.vo.YearMonthDayStartAndEnd;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.excel.CustomCellWriteHeightConfig;
import vip.xiaonuo.biz.modular.balancedetail.excel.CustomCellWriteWidthConfig;
import vip.xiaonuo.biz.modular.balancedetail.excel.EasyExcelStyleStrategy;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailCompareParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailPageParam;
import vip.xiaonuo.biz.modular.balancedetail.service.BizBalanceDetailService;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainAddParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainEditParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainIdParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainPageParam;
import vip.xiaonuo.biz.modular.balancemain.service.BizBalanceMainService;
import vip.xiaonuo.common.annotation.CommonLog;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.pojo.CommonResult;
import vip.xiaonuo.common.pojo.CommonValidList;
import vip.xiaonuo.common.util.CommonDownloadUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 账户余额控制器
 *
 * @author monezhao
 * @date 2023/12/25 16:56
 */
@Api(tags = "账户余额控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
@Slf4j
public class BizBalanceMainController {

    @Resource
    private BizBalanceMainService bizBalanceMainService;

    @Resource
    private BizBalanceDetailService bizBalanceDetailService;

    /**
     * 获取账户余额分页
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation("获取账户余额分页")
    @SaCheckPermission("/biz/balancemain/page")
    @GetMapping("/biz/balancemain/page")
    public CommonResult<Page<BizBalanceMain>> page(BizBalanceMainPageParam bizBalanceMainPageParam) {
        return CommonResult.data(bizBalanceMainService.page(bizBalanceMainPageParam));
    }

    /**
     * 获取账户余额分页
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation("获取账户余额回收站分页")
    @SaCheckPermission("/biz/balancemain/page")
    @GetMapping("/biz/balancemain/pageDelete")
    public CommonResult<Page<BizBalanceMain>> pageDelete(BizBalanceMainPageParam bizBalanceMainPageParam) {
        bizBalanceMainPageParam.setUserId(StpUtil.getLoginIdAsString());
        bizBalanceMainPageParam.setDeleteFlag(new Date());
        return CommonResult.data(bizBalanceMainService.page(bizBalanceMainPageParam));
    }

    /**
     * 添加账户余额
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 2)
    @ApiOperation("添加账户余额")
    @CommonLog("添加账户余额")
    @SaCheckPermission("/biz/balancemain/add")
    @PostMapping("/biz/balancemain/add")
    public CommonResult<String> add(@RequestBody @Valid BizBalanceMainAddParam bizBalanceMainAddParam) {
        bizBalanceMainService.add(bizBalanceMainAddParam);
        return CommonResult.ok();
    }

    /**
     * 账户余额复制
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 2)
    @ApiOperation("账户余额复制")
    @CommonLog("账户余额复制")
    @SaCheckPermission("/biz/balancemain/add")
    @PostMapping("/biz/balancemain/copy")
    public CommonResult<String> copy(@RequestBody @Valid BizBalanceMainAddParam bizBalanceMainAddParam) {
        bizBalanceDetailService.copy(bizBalanceMainAddParam);
        return CommonResult.ok();
    }

    /**
     * 编辑账户余额
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 3)
    @ApiOperation("编辑账户余额")
    @CommonLog("编辑账户余额")
    @SaCheckPermission("/biz/balancemain/edit")
    @PostMapping("/biz/balancemain/edit")
    public CommonResult<String> edit(@RequestBody @Valid BizBalanceMainEditParam bizBalanceMainEditParam) {
        bizBalanceMainService.edit(bizBalanceMainEditParam);
        return CommonResult.ok();
    }

    /**
     * 删除账户余额
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 4)
    @ApiOperation("删除账户余额")
    @CommonLog("删除账户余额")
    @SaCheckPermission("/biz/balancemain/delete")
    @PostMapping("/biz/balancemain/delete")
    public CommonResult<String> delete(@RequestBody @Valid @NotEmpty(message = "集合不能为空")
                                       CommonValidList<BizBalanceMainIdParam> bizBalanceMainIdParamList) {
        bizBalanceDetailService.deleteMain(
                bizBalanceMainIdParamList.stream().map(BizBalanceMainIdParam::getId).collect(Collectors.toList())
        );
        return CommonResult.ok();
    }

    /**
     * 获取账户余额详情
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 5)
    @ApiOperation("获取账户余额详情")
    @SaCheckPermission("/biz/balancemain/detail")
    @GetMapping("/biz/balancemain/detail")
    public CommonResult<BizBalanceMain> detail(@Valid BizBalanceMainIdParam bizBalanceMainIdParam) {
        return CommonResult.data(bizBalanceMainService.detail(bizBalanceMainIdParam));
    }

    @ApiOperationSupport(order = 6)
    @ApiOperation("更新全部账户余额")
    @PostMapping(value = "/biz/balancemain/fixBatch")
    @CommonLog("更新全部账户余额")
    @SaCheckPermission("/biz/balancemain/edit")
    public CommonResult<String> fixBatch() {
        bizBalanceDetailService.fixBatch();
        return CommonResult.ok();
    }

    @ApiOperationSupport(order = 7)
    @ApiOperation("还原账户余额")
    @GetMapping(value = "/biz/balancemain/restore")
    @CommonLog("还原账户余额")
    @SaCheckPermission("/biz/balancemain/edit")
    public CommonResult<String> restore(@RequestParam String ids) {
        if (ids == null || ids.trim().isEmpty()) {
            return CommonResult.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        bizBalanceDetailService.restoreMain(Arrays.asList(idsArr));
        return CommonResult.ok();
    }

    /**
     * 账户余额对比
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 8)
    @ApiOperation("账户余额对比")
    @CommonLog("账户余额对比")
    @SaCheckLogin
    @PostMapping("/biz/balancemain/compare")

    public CommonResult<BizBalanceMain> compare(@RequestBody @Valid BizBalanceMainAddParam bizBalanceMainAddParam) {
        QueryWrapper<BizBalanceMain> queryWrapper = new QueryWrapper<>();
        String userId = StpUtil.getLoginIdAsString();
        Date date = bizBalanceMainAddParam.getAccountDate();
        queryWrapper.lambda()
                .eq(BizBalanceMain::getUserId, userId)
                .eq(BizBalanceMain::getAccountDate, date);
        BizBalanceMain balanceMain = bizBalanceMainService.getOne(queryWrapper, false);
        if (Objects.isNull(balanceMain)) {
            YearMonthDayStartAndEnd startAndEnd =
                    DateTimeUtil.dateToYearMonthDayStartAndEnd(date);
            queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda()
                    .eq(BizBalanceMain::getUserId, userId)
                    .between(BizBalanceMain::getAccountDate, startAndEnd.getFirstDayOfMonth(), startAndEnd.getLastDayOfMonth());
            List<BizBalanceMain> list = bizBalanceMainService.list(queryWrapper);
            if (list.isEmpty()) {
                BizBalanceMain res = new BizBalanceMain();
                res.setRemark("对比月份无记录");
                return CommonResult.data(res);
            } else {
                BizBalanceMain res = new BizBalanceMain();
                res.setRemark("当前日期无记录, 可选择以下日期" +
                        list.stream()
                                .map(vo -> DateUtil.formatDate(vo.getAccountDate()))
                                .collect(Collectors.joining(", ", "[", "]"))
                );
                return CommonResult.data(res);
            }
        } else {
            return CommonResult.data(balanceMain);
        }
    }

    /**
     * 账户详情对比
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 9)
    @ApiOperation("账户详情对比")
    @CommonLog("账户详情对比")
    @SaCheckLogin
    @PostMapping("/biz/balancemain/compareDetail")
    public CommonResult<BizBalanceDetail> compare(@RequestBody @Valid BizBalanceDetailCompareParam compareParam) {
        QueryWrapper<BizBalanceMain> queryWrapper = new QueryWrapper<>();
        String userId = StpUtil.getLoginIdAsString();
        Date date = compareParam.getAccountDate();
        queryWrapper.lambda()
                .eq(BizBalanceMain::getUserId, userId)
                .eq(BizBalanceMain::getAccountDate, date);
        BizBalanceMain sysBalanceMain = bizBalanceMainService.getOne(queryWrapper, false);
        if (Objects.isNull(sysBalanceMain)) {
            YearMonthDayStartAndEnd startAndEnd =
                    DateTimeUtil.dateToYearMonthDayStartAndEnd(date);
            queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda()
                    .eq(BizBalanceMain::getUserId, userId)
                    .between(BizBalanceMain::getAccountDate, startAndEnd.getFirstDayOfMonth(), startAndEnd.getLastDayOfMonth());
            List<BizBalanceMain> list = bizBalanceMainService.list(queryWrapper);
            if (list.isEmpty()) {
                BizBalanceDetail res = new BizBalanceDetail();
                res.setRemark("对比月份无记录");
                return CommonResult.data(res);
            } else {
                BizBalanceDetail res = new BizBalanceDetail();
                res.setRemark("当前日期无记录, 可选择以下日期" +
                        list.stream()
                                .map(vo -> DateUtil.formatDate(vo.getAccountDate()))
                                .collect(Collectors.joining(", ", "[", "]"))
                );
                return CommonResult.data(res);
            }
        } else {
            QueryWrapper<BizBalanceDetail> detailQueryWrapper = new QueryWrapper<>();
            detailQueryWrapper.lambda()
                    .eq(BizBalanceDetail::getBalanceMainId, sysBalanceMain.getId())
                    .eq(BizBalanceDetail::getBalanceType, compareParam.getBalanceType());
            BizBalanceDetail detail = bizBalanceDetailService.getOne(detailQueryWrapper, false);
            if (detail == null) {
                BizBalanceDetail res = new BizBalanceDetail();
                res.setRemark("对比日期无类型记录");
                return CommonResult.data(res);
            } else {
                return CommonResult.data(detail);
            }
        }
    }

    /**
     * 账户余额文件上传
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 10)
    @ApiOperation("账户余额文件上传")
    @CommonLog("账户余额文件上传")
    @SaCheckPermission("/biz/balancemain/import")
    @PostMapping("/biz/balancemain/import")
    public CommonResult<String> doImport(@RequestPart("file") @ApiParam(value = "文件", required = true) MultipartFile file) throws IOException {
        bizBalanceDetailService.importManager(file);
        return CommonResult.ok();
    }

    /**
     * 导出全部账户余额
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 10)
    @ApiOperation("导出全部账户余额")
    @CommonLog("导出全部账户余额")
    @SaCheckPermission("/biz/balancemain/export")
    @PostMapping("/biz/balancemain/export")
    public void doExport(HttpServletResponse response) {
        try {
            List<BizBalanceMain> balanceMains = bizBalanceMainService.list(new BizBalanceMainPageParam());
            List<BizBalanceDetail> balanceDetails = bizBalanceDetailService.list(new BizBalanceDetailPageParam());

            Collections.reverse(balanceMains);
            Collections.reverse(balanceDetails);

            ByteArrayOutputStream arrayOutputStream = new ByteArrayOutputStream();
            ExcelWriter excelWriter = EasyExcel.write(arrayOutputStream)
                    /*自适应列宽*/
                    .registerWriteHandler(new CustomCellWriteWidthConfig())
                    /*自适应行高*/
                    .registerWriteHandler(new CustomCellWriteHeightConfig())
                    /*自适应行高*/
                    .registerWriteHandler(EasyExcelStyleStrategy.getStyleStrategy())
                    .build();

            WriteSheet writeSheet = EasyExcel.writerSheet(0, "账户余额").head(BizBalanceMain.class).build();
            excelWriter.write(balanceMains, writeSheet);

            writeSheet = EasyExcel.writerSheet(1, "账户明细").head(BizBalanceDetail.class).build();
            excelWriter.write(balanceDetails, writeSheet);

            excelWriter.finish();

            String fileName = "账户余额" + DateUtil.format(new Date(), "yyyyMMddHHmmss") + ".xlsx";
            CommonDownloadUtil.download(fileName, arrayOutputStream.toByteArray(), response);

        } catch (Exception e) {
            throw new CommonException("下载文件失败：" + e.getMessage());
        }
    }
}
