package com.monezhao.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.util.JacksonUtil;
import com.monezhao.service.SysBalanceMainService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/7/2 5:31 下午
 */
@Slf4j
public class UploadSysBalanceMainListener extends AnalysisEventListener<SysBalanceMain> {

    private static final int BATCH_COUNT = 1000;
    private final SysBalanceMainService mainService;
    List<SysBalanceMain> list = new ArrayList<>();

    private DataSourceTransactionManager dataSourceTransactionManager;

    private TransactionStatus transactionStatus;

    public UploadSysBalanceMainListener(SysBalanceMainService mainService, DataSourceTransactionManager dataSourceTransactionManager,
                                        TransactionStatus transactionStatus) {
        this.mainService = mainService;
        this.dataSourceTransactionManager = dataSourceTransactionManager;
        this.transactionStatus = transactionStatus;
    }

    @Override
    public void invoke(SysBalanceMain sysBalanceMain, AnalysisContext analysisContext) {
        // 如果事务已经关闭
        if (transactionStatus.isCompleted()) {
            return;
        }
        log.info("解析到一条数据:{}", JacksonUtil.objToStr(sysBalanceMain));
        list.add(sysBalanceMain);
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
//        if (!transactionStatus.isCompleted()) {
//            // 提交事务
//            dataSourceTransactionManager.commit(transactionStatus);
//        }
    }

    @Override
    public void onException(Exception exception, AnalysisContext context) throws Exception {
        dataSourceTransactionManager.rollback(transactionStatus);
        throw new RuntimeException("解析账户余额出错: " + exception.getMessage());
    }

    private void saveData() {
        try {
            mainService.doImport(list);
        } catch (Exception e) {
            dataSourceTransactionManager.rollback(transactionStatus);
            log.info("解析账户余额出错");
            throw new RuntimeException("解析账户余额出错: " + e.getMessage());
        }
    }
}
