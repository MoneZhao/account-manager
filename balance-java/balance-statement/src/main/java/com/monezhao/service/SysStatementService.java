package com.monezhao.service;

import com.monezhao.command.StatementCommand;
import com.monezhao.command.StatementResultCommand;

/**
 * @author monezhao@163.com
 * @date 2020/10/23 2:57 下午
 */
public interface SysStatementService {
    /**
     * 查询账户报表
     *
     * @param command command
     * @return StatementResultCommand
     */
    StatementResultCommand query(StatementCommand command);

    /**
     * 查询账户详情报表
     *
     * @param command command
     * @return StatementResultCommand
     */
    StatementResultCommand queryDetail(StatementCommand command);
}
