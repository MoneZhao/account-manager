package com.monezhao.config;

import com.monezhao.common.util.CommonUtil;
import com.p6spy.engine.spy.appender.MessageFormattingStrategy;
import lombok.extern.slf4j.Slf4j;

/**
 * @author monezhao@163.com
 * @date 2020/11/26 7:35 下午
 */
@Slf4j
public class CustomSqlFormat implements MessageFormattingStrategy {
    @Override
    public String formatMessage(int connectionId, String now, long elapsed, String category,
                                String prepared, String sql, String url) {
        if (CommonUtil.isEmptyStr(sql)) {
            return "";
        } else {
            if (elapsed > 200) {
                log.info("用时超过200ms!!!");
            }
            return "\n# " + now + " | 执行sql用时 " + elapsed + "ms" + "\n==>    SQl开始:\n" + sql + "\n<==    SQL结束";
        }
    }
}
