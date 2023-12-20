package vip.xiaonuo.core.config;

import cn.hutool.core.util.StrUtil;
import com.p6spy.engine.spy.appender.MessageFormattingStrategy;
import lombok.extern.slf4j.Slf4j;

/**
 * @author monezhao@163.com
 * @date 2023-07-15 下午 12:26
 */
@Slf4j
public class CustomSqlFormat implements MessageFormattingStrategy {
    @Override
    public String formatMessage(int connectionId, String now, long elapsed, String category,
                                String prepared, String sql, String url) {
        if (StrUtil.isEmptyIfStr(sql)) {
            return "";
        } else {
            if (elapsed > 200) {
                log.warn("用时超过200ms!!!");
            }
            return "\n================================= " + now + " | 执行sql用时 " + elapsed + " ms ================================"
                    + "\n<==    sql开始, category: " + category
                    + "\n" + sql
                    + "\n<==    sql结束"
                    + "\n========================================================================================================\n";
        }
    }
}
