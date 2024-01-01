package vip.xiaonuo.biz.modular.balancemain.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import vip.xiaonuo.biz.modular.balancedetail.service.BizBalanceDetailService;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainAddParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainEditParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainIdParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainPageParam;
import vip.xiaonuo.biz.modular.balancemain.service.BizBalanceMainService;
import vip.xiaonuo.common.annotation.CommonLog;
import vip.xiaonuo.common.pojo.CommonResult;
import vip.xiaonuo.common.pojo.CommonValidList;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import java.util.Arrays;
import java.util.Date;
import java.util.stream.Collectors;

/**
 * 账户余额控制器
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 */
@Api(tags = "账户余额控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
public class BizBalanceMainController {

    @Resource
    private BizBalanceMainService bizBalanceMainService;

    @Resource
    private BizBalanceDetailService detailService;

    /**
     * 获取账户余额分页
     *
     * @author monezhao
     * @date  2023/12/25 16:56
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
     * @date  2023/12/25 16:56
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
     * @date  2023/12/25 16:56
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
     * @date  2023/12/25 16:56
     */
    @ApiOperationSupport(order = 2)
    @ApiOperation("账户余额复制")
    @CommonLog("账户余额复制")
    @SaCheckPermission("/biz/balancemain/add")
    @PostMapping("/biz/balancemain/copy")
    public CommonResult<String> copy(@RequestBody @Valid BizBalanceMainAddParam bizBalanceMainAddParam) {
        detailService.copy(bizBalanceMainAddParam);
        return CommonResult.ok();
    }

    /**
     * 编辑账户余额
     *
     * @author monezhao
     * @date  2023/12/25 16:56
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
     * @date  2023/12/25 16:56
     */
    @ApiOperationSupport(order = 4)
    @ApiOperation("删除账户余额")
    @CommonLog("删除账户余额")
    @SaCheckPermission("/biz/balancemain/delete")
    @PostMapping("/biz/balancemain/delete")
    public CommonResult<String> delete(@RequestBody @Valid @NotEmpty(message = "集合不能为空")
                                                   CommonValidList<BizBalanceMainIdParam> bizBalanceMainIdParamList) {
        detailService.deleteMain(
                bizBalanceMainIdParamList.stream().map(BizBalanceMainIdParam::getId).collect(Collectors.toList())
        );
        return CommonResult.ok();
    }

    /**
     * 获取账户余额详情
     *
     * @author monezhao
     * @date  2023/12/25 16:56
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
        detailService.fixBatch();
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
        detailService.restoreMain(Arrays.asList(idsArr));
        return CommonResult.ok();
    }
}
