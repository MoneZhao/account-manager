package com.monezhao.config;

import com.p6spy.engine.spy.appender.MessageFormattingStrategy;

/**
 * @author monezhao@163.com
 * @date 2020/11/26 7:35 下午
 */
public class CustomSqlFormat implements MessageFormattingStrategy {
    @Override
    public String formatMessage(int connectionId, String now, long elapsed, String category,
                                String prepared, String sql, String url) {
        return "\n# " + now + " | 执行sql用时 " + elapsed + "ms" + "\n==>    SQl开始:\n" + sql + "\n<==    SQL结束";
    }
}