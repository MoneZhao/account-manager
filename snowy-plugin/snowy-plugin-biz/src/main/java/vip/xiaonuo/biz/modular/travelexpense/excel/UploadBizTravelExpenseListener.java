package vip.xiaonuo.biz.modular.travelexpense.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.service.impl.BizTravelExpenseServiceImpl;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2024/1/26 14:48
 */
@Slf4j
public class UploadBizTravelExpenseListener extends AnalysisEventListener<BizTravelExpense> {

    private static final int BATCH_COUNT = 1000;

    BizTravelExpenseServiceImpl travelExpenseService;

    List<BizTravelExpense> list = new ArrayList<>();

    private DataSourceTransactionManager dataSourceTransactionManager;

    private TransactionStatus transactionStatus;

    public UploadBizTravelExpenseListener(BizTravelExpenseServiceImpl travelExpenseService, DataSourceTransactionManager dataSourceTransactionManager,
                                          TransactionStatus transaction) {
        this.travelExpenseService = travelExpenseService;
        this.dataSourceTransactionManager = dataSourceTransactionManager;
        this.transactionStatus = transaction;
    }

    @Override
    public void invoke(BizTravelExpense bizTravelExpense, AnalysisContext analysisContext) {
        // 如果事务已经关闭
        if (transactionStatus.isCompleted()) {
            return;
        }
        list.add(bizTravelExpense);
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
        log.info("所有出差报销数据解析完成！");
        if (!transactionStatus.isCompleted()) {
            // 提交事务
            dataSourceTransactionManager.commit(transactionStatus);
        }
    }

    @Override
    public void onException(Exception exception, AnalysisContext context) throws Exception {
        log.error("解析出差报销onException出错: " + exception.getMessage(), exception);
        dataSourceTransactionManager.rollback(transactionStatus);
        throw new RuntimeException("解析出差报销onException出错: " + exception.getMessage());
    }

    private void saveData() {
        try {
            travelExpenseService.doImport(list);
        } catch (Exception e) {
            log.error("解析出差报销onException出错: " + e.getMessage(), e);
            dataSourceTransactionManager.rollback(transactionStatus);
            throw new RuntimeException("解析出差报销doImport出错: " + e.getMessage());
        }
    }
}
