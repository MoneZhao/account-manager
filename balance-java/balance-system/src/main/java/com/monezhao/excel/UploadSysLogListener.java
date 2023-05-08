package com.monezhao.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.util.JacksonUtil;
import com.monezhao.service.SysLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2023/5/8 9:48 AM
 */
@Slf4j
public class UploadSysLogListener extends AnalysisEventListener<SysLog> {

    private static final int BATCH_COUNT = 1000;

    private final SysLogService logService;

    List<SysLog> list = new ArrayList<>();

    private DataSourceTransactionManager dataSourceTransactionManager;
    private DefaultTransactionDefinition transactionDefinition;
    private TransactionStatus transactionStatus;

    public UploadSysLogListener(SysLogService logService, DataSourceTransactionManager dataSourceTransactionManager,
                                TransactionDefinition transactionDefinition) {
        this.logService = logService;
        this.dataSourceTransactionManager = dataSourceTransactionManager;
        this.transactionDefinition = new DefaultTransactionDefinition(transactionDefinition);
        this.transactionStatus = this.dataSourceTransactionManager.getTransaction(this.transactionDefinition);
    }

    @Override
    public void invoke(SysLog sysLog, AnalysisContext analysisContext) {
        // 如果事务已经关闭
        if (transactionStatus.isCompleted()) {
            return;
        }
        log.info("解析到一条数据:{}", JacksonUtil.objToStr(sysLog));
        list.add(sysLog);
        if (list.size() >= BATCH_COUNT) {
            saveData();
            list.clear();
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        // 如果事务已经关闭
        if (transactionStatus.isCompleted()) {
            return;
        }
        saveData();
        log.info("所有数据解析完成！");
        if (!transactionStatus.isCompleted()) {
            // 提交事务
            dataSourceTransactionManager.commit(transactionStatus);
        }
    }

    @Override
    public void onException(Exception exception, AnalysisContext context) throws Exception {
        dataSourceTransactionManager.rollback(transactionStatus);
        log.error("错误回滚", exception);
        throw exception;
    }

    private void saveData() {
        logService.doImport(list);
    }
}
