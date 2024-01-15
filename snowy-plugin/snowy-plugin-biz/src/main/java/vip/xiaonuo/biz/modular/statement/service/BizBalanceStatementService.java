package vip.xiaonuo.biz.modular.statement.service;

import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.statement.param.StatementDetailCommand;
import vip.xiaonuo.biz.modular.statement.param.StatementDetailStatementCommand;
import vip.xiaonuo.biz.modular.statement.param.StatementMainCommand;
import vip.xiaonuo.biz.modular.statement.vo.StatementResultCommand;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2024/1/12 2:48 PM
 */
public interface BizBalanceStatementService {

    /**
     * 查询账户报表
     *
     * @param command command
     * @return StatementResultCommand
     */
    StatementResultCommand query(StatementMainCommand command);

    /**
     * 查询账户详情报表
     *
     * @param command command
     * @return StatementResultCommand
     */
    StatementResultCommand queryDetail(StatementDetailCommand command);

    List<BizBalanceDetail> listStatement(StatementDetailStatementCommand command);
}
