package vip.xiaonuo.core.config;

import com.p6spy.engine.common.StatementInformation;
import com.p6spy.engine.logging.LoggingEventListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

/**
 * @author monezhao@163.com
 * @date 2023-07-18 下午 04:00
 */
public class DontLogExecuteBatchEventListener extends LoggingEventListener {
    private Logger log = LoggerFactory.getLogger("p6spy");
    @Override
    public void onAfterExecuteBatch(StatementInformation statementInformation, long timeElapsedNanos, int[] updateCounts, SQLException e) {
        log.info("批量插入结束, 用时: {} ms\n", TimeUnit.NANOSECONDS.toMillis(timeElapsedNanos));
    }
}
