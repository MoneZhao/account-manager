package vip.xiaonuo.biz.modular.travelexpense.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import vip.xiaonuo.common.annotation.CommonLog;
import vip.xiaonuo.common.pojo.CommonResult;
import vip.xiaonuo.common.pojo.CommonValidList;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseAddParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseEditParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseIdParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpensePageParam;
import vip.xiaonuo.biz.modular.travelexpense.service.BizTravelExpenseService;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;

/**
 * 出差报销控制器
 *
 * @author monezhao
 * @date  2023/12/23 19:25
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
     * @date  2023/12/23 19:25
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
     * @date  2023/12/23 19:25
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
     * @date  2023/12/23 19:25
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
     * @date  2023/12/23 19:25
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
     * @date  2023/12/23 19:25
     */
    @ApiOperationSupport(order = 5)
    @ApiOperation("获取出差报销详情")
    @SaCheckPermission("/biz/travelexpense/detail")
    @GetMapping("/biz/travelexpense/detail")
    public CommonResult<BizTravelExpense> detail(@Valid BizTravelExpenseIdParam bizTravelExpenseIdParam) {
        return CommonResult.data(bizTravelExpenseService.detail(bizTravelExpenseIdParam));
    }
}
