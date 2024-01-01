package vip.xiaonuo.biz.modular.balancecount.controller;

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
import vip.xiaonuo.biz.modular.balancecount.entity.BizBalanceCount;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountEditParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountPageParam;
import vip.xiaonuo.biz.modular.balancecount.service.BizBalanceCountService;
import vip.xiaonuo.common.annotation.CommonLog;
import vip.xiaonuo.common.pojo.CommonResult;

import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * 计入总资产控制器
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 */
@Api(tags = "计入总资产控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
public class BizBalanceCountController {

    @Resource
    private BizBalanceCountService bizBalanceCountService;

    /**
     * 获取计入总资产分页
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation("获取计入总资产分页")
    @SaCheckPermission("/biz/balancecount/page")
    @GetMapping("/biz/balancecount/page")
    public CommonResult<Page<BizBalanceCount>> page(BizBalanceCountPageParam bizBalanceCountPageParam) {
        return CommonResult.data(bizBalanceCountService.page(bizBalanceCountPageParam));
    }

//    /**
//     * 添加计入总资产
//     *
//     * @author monezhao
//     * @date  2023/12/23 21:12
//     */
//    @ApiOperationSupport(order = 2)
//    @ApiOperation("添加计入总资产")
//    @CommonLog("添加计入总资产")
//    @SaCheckPermission("/biz/balancecount/add")
//    @PostMapping("/biz/balancecount/add")
//    public CommonResult<String> add(@RequestBody @Valid BizBalanceCountAddParam bizBalanceCountAddParam) {
//        bizBalanceCountService.add(bizBalanceCountAddParam);
//        return CommonResult.ok();
//    }

    /**
     * 编辑计入总资产
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    @ApiOperationSupport(order = 3)
    @ApiOperation("编辑计入总资产")
    @CommonLog("编辑计入总资产")
    @SaCheckPermission("/biz/balancecount/edit")
    @PostMapping("/biz/balancecount/edit")
    public CommonResult<String> edit(@RequestBody @Valid BizBalanceCountEditParam bizBalanceCountEditParam) {
        bizBalanceCountService.edit(bizBalanceCountEditParam);
        return CommonResult.ok();
    }

//    /**
//     * 删除计入总资产
//     *
//     * @author monezhao
//     * @date  2023/12/23 21:12
//     */
//    @ApiOperationSupport(order = 4)
//    @ApiOperation("删除计入总资产")
//    @CommonLog("删除计入总资产")
//    @SaCheckPermission("/biz/balancecount/delete")
//    @PostMapping("/biz/balancecount/delete")
//    public CommonResult<String> delete(@RequestBody @Valid @NotEmpty(message = "集合不能为空")
//                                                   CommonValidList<BizBalanceCountIdParam> bizBalanceCountIdParamList) {
//        bizBalanceCountService.delete(bizBalanceCountIdParamList);
//        return CommonResult.ok();
//    }
//
//    /**
//     * 获取计入总资产详情
//     *
//     * @author monezhao
//     * @date  2023/12/23 21:12
//     */
//    @ApiOperationSupport(order = 5)
//    @ApiOperation("获取计入总资产详情")
//    @SaCheckPermission("/biz/balancecount/detail")
//    @GetMapping("/biz/balancecount/detail")
//    public CommonResult<BizBalanceCount> detail(@Valid BizBalanceCountIdParam bizBalanceCountIdParam) {
//        return CommonResult.data(bizBalanceCountService.detail(bizBalanceCountIdParam));
//    }
}
