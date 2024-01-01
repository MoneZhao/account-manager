package vip.xiaonuo.biz.modular.balancedetail.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
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
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailAddParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailEditParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailIdParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailPageParam;
import vip.xiaonuo.biz.modular.balancedetail.service.BizBalanceDetailService;
import vip.xiaonuo.common.annotation.CommonLog;
import vip.xiaonuo.common.pojo.CommonResult;
import vip.xiaonuo.common.pojo.CommonValidList;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;

/**
 * 账户明细控制器
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 */
@Api(tags = "账户明细控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
public class BizBalanceDetailController {

    @Resource
    private BizBalanceDetailService bizBalanceDetailService;

    /**
     * 获取账户明细分页
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation("获取账户明细分页")
    @SaCheckLogin
    @GetMapping("/biz/balancedetail/page")
    public CommonResult<Page<BizBalanceDetail>> page(BizBalanceDetailPageParam bizBalanceDetailPageParam) {
        return CommonResult.data(bizBalanceDetailService.page(bizBalanceDetailPageParam));
    }

    /**
     * 添加账户明细
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    @ApiOperationSupport(order = 2)
    @ApiOperation("添加账户明细")
    @CommonLog("添加账户明细")
    @SaCheckLogin
    @PostMapping("/biz/balancedetail/add")
    public CommonResult<String> add(@RequestBody @Valid BizBalanceDetailAddParam bizBalanceDetailAddParam) {
        bizBalanceDetailService.add(bizBalanceDetailAddParam);
        return CommonResult.ok();
    }

    /**
     * 编辑账户明细
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    @ApiOperationSupport(order = 3)
    @ApiOperation("编辑账户明细")
    @CommonLog("编辑账户明细")
    @SaCheckLogin
    @PostMapping("/biz/balancedetail/edit")
    public CommonResult<String> edit(@RequestBody @Valid BizBalanceDetailEditParam bizBalanceDetailEditParam) {
        bizBalanceDetailService.edit(bizBalanceDetailEditParam);
        return CommonResult.ok();
    }

    /**
     * 删除账户明细
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    @ApiOperationSupport(order = 4)
    @ApiOperation("删除账户明细")
    @CommonLog("删除账户明细")
    @SaCheckLogin
    @PostMapping("/biz/balancedetail/delete")
    public CommonResult<String> delete(@RequestBody @Valid @NotEmpty(message = "集合不能为空")
                                                   CommonValidList<BizBalanceDetailIdParam> bizBalanceDetailIdParamList) {
        bizBalanceDetailService.delete(bizBalanceDetailIdParamList);
        return CommonResult.ok();
    }

    /**
     * 获取账户明细详情
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    @ApiOperationSupport(order = 5)
    @ApiOperation("获取账户明细详情")
    @SaCheckLogin
    @GetMapping("/biz/balancedetail/detail")
    public CommonResult<BizBalanceDetail> detail(@Valid BizBalanceDetailIdParam bizBalanceDetailIdParam) {
        return CommonResult.data(bizBalanceDetailService.detail(bizBalanceDetailIdParam));
    }
}
