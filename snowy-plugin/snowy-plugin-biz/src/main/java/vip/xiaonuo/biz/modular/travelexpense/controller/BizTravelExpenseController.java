package vip.xiaonuo.biz.modular.travelexpense.controller;

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
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vip.xiaonuo.biz.modular.balancedetail.excel.CustomCellWriteHeightConfig;
import vip.xiaonuo.biz.modular.balancedetail.excel.CustomCellWriteWidthConfig;
import vip.xiaonuo.biz.modular.balancedetail.excel.EasyExcelStyleStrategy;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseAddParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseEditParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseIdParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpensePageParam;
import vip.xiaonuo.biz.modular.travelexpense.service.BizTravelExpenseService;
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
import java.util.Date;
import java.util.List;

/**
 * 出差报销控制器
 *
 * @author monezhao
 * @date 2023/12/23 19:25
 */
@Api(tags = "出差报销控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
public class BizTravelExpenseController {

    @Resource
    private BizTravelExpenseService bizTravelExpenseService;

    /**
     * 获取出差报销分页
     *
     * @author monezhao
     * @date 2023/12/23 19:25
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation("获取出差报销分页")
    @SaCheckPermission("/biz/travelexpense/page")
    @GetMapping("/biz/travelexpense/page")
    public CommonResult<Page<BizTravelExpense>> page(BizTravelExpensePageParam bizTravelExpensePageParam) {
        return CommonResult.data(bizTravelExpenseService.page(bizTravelExpensePageParam));
    }

    /**
     * 添加出差报销
     *
     * @author monezhao
     * @date 2023/12/23 19:25
     */
    @ApiOperationSupport(order = 2)
    @ApiOperation("添加出差报销")
    @CommonLog("添加出差报销")
    @SaCheckPermission("/biz/travelexpense/add")
    @PostMapping("/biz/travelexpense/add")
    public CommonResult<String> add(@RequestBody @Valid BizTravelExpenseAddParam bizTravelExpenseAddParam) {
        bizTravelExpenseService.add(bizTravelExpenseAddParam);
        return CommonResult.ok();
    }

    /**
     * 编辑出差报销
     *
     * @author monezhao
     * @date 2023/12/23 19:25
     */
    @ApiOperationSupport(order = 3)
    @ApiOperation("编辑出差报销")
    @CommonLog("编辑出差报销")
    @SaCheckPermission("/biz/travelexpense/edit")
    @PostMapping("/biz/travelexpense/edit")
    public CommonResult<String> edit(@RequestBody @Valid BizTravelExpenseEditParam bizTravelExpenseEditParam) {
        bizTravelExpenseService.edit(bizTravelExpenseEditParam);
        return CommonResult.ok();
    }

    /**
     * 删除出差报销
     *
     * @author monezhao
     * @date 2023/12/23 19:25
     */
    @ApiOperationSupport(order = 4)
    @ApiOperation("删除出差报销")
    @CommonLog("删除出差报销")
    @SaCheckPermission("/biz/travelexpense/delete")
    @PostMapping("/biz/travelexpense/delete")
    public CommonResult<String> delete(@RequestBody @Valid @NotEmpty(message = "集合不能为空")
                                       CommonValidList<BizTravelExpenseIdParam> bizTravelExpenseIdParamList) {
        bizTravelExpenseService.delete(bizTravelExpenseIdParamList);
        return CommonResult.ok();
    }

    /**
     * 获取出差报销详情
     *
     * @author monezhao
     * @date 2023/12/23 19:25
     */
    @ApiOperationSupport(order = 5)
    @ApiOperation("获取出差报销详情")
    @SaCheckPermission("/biz/travelexpense/detail")
    @GetMapping("/biz/travelexpense/detail")
    public CommonResult<BizTravelExpense> detail(@Valid BizTravelExpenseIdParam bizTravelExpenseIdParam) {
        return CommonResult.data(bizTravelExpenseService.detail(bizTravelExpenseIdParam));
    }

    /**
     * 出差报销文件上传
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 6)
    @ApiOperation("出差报销文件上传")
    @CommonLog("出差报销文件上传")
    @SaCheckPermission("/biz/travelexpense/import")
    @PostMapping("/biz/travelexpense/import")
    public CommonResult<String> doImport(@RequestPart("file") @ApiParam(value = "文件", required = true) MultipartFile file) throws IOException {
        bizTravelExpenseService.importManager(file);
        return CommonResult.ok();
    }

    /**
     * 导出全部出差报销
     *
     * @author monezhao
     * @date 2023/12/25 16:56
     */
    @ApiOperationSupport(order = 7)
    @ApiOperation("导出全部出差报销")
    @CommonLog("导出全部出差报销")
    @SaCheckPermission("/biz/travelexpense/export")
    @PostMapping("/biz/travelexpense/export")
    public void doExport(HttpServletResponse response) {
        try {
            QueryWrapper<BizTravelExpense> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(BizTravelExpense::getUserId, StpUtil.getLoginIdAsString());
            queryWrapper.lambda()
                    .orderByAsc(BizTravelExpense::getRequestDate)
                    .orderByAsc(BizTravelExpense::getGetDate);
            List<BizTravelExpense> travelExpenses = bizTravelExpenseService.list(queryWrapper);

            ByteArrayOutputStream arrayOutputStream = new ByteArrayOutputStream();
            ExcelWriter excelWriter = EasyExcel.write(arrayOutputStream)
                    /*自适应列宽*/
                    .registerWriteHandler(new CustomCellWriteWidthConfig())
                    /*自适应行高*/
                    .registerWriteHandler(new CustomCellWriteHeightConfig())
                    /*自适应行高*/
                    .registerWriteHandler(EasyExcelStyleStrategy.getStyleStrategy())
                    .build();

            WriteSheet writeSheet = EasyExcel.writerSheet(0, "出差报销").head(BizTravelExpense.class).build();
            excelWriter.write(travelExpenses, writeSheet);

            excelWriter.finish();

            String fileName = "出差报销" + DateUtil.format(new Date(), "yyyyMMddHHmmss") + ".xlsx";
            CommonDownloadUtil.download(fileName, arrayOutputStream.toByteArray(), response);
        } catch (Exception e) {
            throw new CommonException("下载文件失败：" + e.getMessage());
        }
    }
}
