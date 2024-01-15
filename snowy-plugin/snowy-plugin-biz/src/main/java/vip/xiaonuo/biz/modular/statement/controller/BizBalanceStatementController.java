package vip.xiaonuo.biz.modular.statement.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.statement.param.StatementDetailCommand;
import vip.xiaonuo.biz.modular.statement.param.StatementDetailStatementCommand;
import vip.xiaonuo.biz.modular.statement.param.StatementMainCommand;
import vip.xiaonuo.biz.modular.statement.service.BizBalanceStatementService;
import vip.xiaonuo.biz.modular.statement.vo.StatementResultCommand;
import vip.xiaonuo.common.pojo.CommonResult;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * 报表管理控制器
 *
 * @author monezhao
 * @date 2023/12/25 16:56
 */
@Api(tags = "报表管理控制器")
@ApiSupport(author = "SNOWY_TEAM", order = 1)
@RestController
@Validated
public class BizBalanceStatementController {

    @Resource
    private BizBalanceStatementService bizBalanceStatementService;

    /**
     * @param command StatementCommand
     * @return Result Result
     */
    @PostMapping(value = "/biz/statement/query")
    @ApiOperation("查询账户报表")
    @SaCheckLogin
    public CommonResult<StatementResultCommand> query(@RequestBody @Valid StatementMainCommand command) {
        return CommonResult.data(bizBalanceStatementService.query(command));
    }

    /**
     * @param command StatementCommand
     * @return Result Result
     */
    @PostMapping(value = "/biz/statement/detail/query")
    @ApiOperation("查询账户报表")
    @SaCheckLogin
    public CommonResult<StatementResultCommand> queryDetail(@RequestBody @Valid StatementDetailCommand command) {
        return CommonResult.data(bizBalanceStatementService.queryDetail(command));
    }

    /**
     * @param command StatementCommand
     * @return Result Result
     */
    @PostMapping(value = "/biz/statement/detail/listStatement")
    @ApiOperation("查询账户详情报表")
    @SaCheckLogin
    public CommonResult<List<BizBalanceDetail>> listStatement(@RequestBody @Valid StatementDetailStatementCommand command) {
        return CommonResult.data(bizBalanceStatementService.listStatement(command));
    }
}
