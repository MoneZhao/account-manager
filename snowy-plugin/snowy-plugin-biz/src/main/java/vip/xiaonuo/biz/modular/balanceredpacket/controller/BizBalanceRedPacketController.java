package vip.xiaonuo.biz.modular.balanceredpacket.controller;

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
import vip.xiaonuo.biz.modular.balanceredpacket.entity.BizBalanceRedPacket;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketAddParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketEditParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketIdParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketPageParam;
import vip.xiaonuo.biz.modular.balanceredpacket.service.BizBalanceRedPacketService;

import javax.annotation.Resource;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;

/**
 * 红包记账控制器
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 */
@Api(tags = "红包记账控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
public class BizBalanceRedPacketController {

    @Resource
    private BizBalanceRedPacketService bizBalanceRedPacketService;

    /**
     * 获取红包记账分页
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    @ApiOperationSupport(order = 1)
    @ApiOperation("获取红包记账分页")
    @SaCheckPermission("/biz/balanceredpacket/page")
    @GetMapping("/biz/balanceredpacket/page")
    public CommonResult<Page<BizBalanceRedPacket>> page(BizBalanceRedPacketPageParam bizBalanceRedPacketPageParam) {
        return CommonResult.data(bizBalanceRedPacketService.page(bizBalanceRedPacketPageParam));
    }

    /**
     * 添加红包记账
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    @ApiOperationSupport(order = 2)
    @ApiOperation("添加红包记账")
    @CommonLog("添加红包记账")
    @SaCheckPermission("/biz/balanceredpacket/add")
    @PostMapping("/biz/balanceredpacket/add")
    public CommonResult<String> add(@RequestBody @Valid BizBalanceRedPacketAddParam bizBalanceRedPacketAddParam) {
        bizBalanceRedPacketService.add(bizBalanceRedPacketAddParam);
        return CommonResult.ok();
    }

    /**
     * 编辑红包记账
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    @ApiOperationSupport(order = 3)
    @ApiOperation("编辑红包记账")
    @CommonLog("编辑红包记账")
    @SaCheckPermission("/biz/balanceredpacket/edit")
    @PostMapping("/biz/balanceredpacket/edit")
    public CommonResult<String> edit(@RequestBody @Valid BizBalanceRedPacketEditParam bizBalanceRedPacketEditParam) {
        bizBalanceRedPacketService.edit(bizBalanceRedPacketEditParam);
        return CommonResult.ok();
    }

    /**
     * 删除红包记账
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    @ApiOperationSupport(order = 4)
    @ApiOperation("删除红包记账")
    @CommonLog("删除红包记账")
    @SaCheckPermission("/biz/balanceredpacket/delete")
    @PostMapping("/biz/balanceredpacket/delete")
    public CommonResult<String> delete(@RequestBody @Valid @NotEmpty(message = "集合不能为空")
                                                   CommonValidList<BizBalanceRedPacketIdParam> bizBalanceRedPacketIdParamList) {
        bizBalanceRedPacketService.delete(bizBalanceRedPacketIdParamList);
        return CommonResult.ok();
    }

    /**
     * 获取红包记账详情
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    @ApiOperationSupport(order = 5)
    @ApiOperation("获取红包记账详情")
    @SaCheckPermission("/biz/balanceredpacket/detail")
    @GetMapping("/biz/balanceredpacket/detail")
    public CommonResult<BizBalanceRedPacket> detail(@Valid BizBalanceRedPacketIdParam bizBalanceRedPacketIdParam) {
        return CommonResult.data(bizBalanceRedPacketService.detail(bizBalanceRedPacketIdParam));
    }
}
