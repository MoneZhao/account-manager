package vip.xiaonuo.biz.modular.balancedetail.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.service.BizBalanceMainService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2024/1/24 10:10
 */
@Slf4j
public class UploadSysBalanceMainListener extends AnalysisEventListener<BizBalanceMain> {

    private static final int BATCH_COUNT = 1000;
    private final BizBalanceMainService mainService;
    List<BizBalanceMain> list = new ArrayList<>();

    private DataSourceTransactionManager dataSourceTransactionManager;

    private TransactionStatus transactionStatus;

    public UploadSysBalanceMainListener(BizBalanceMainService mainService, DataSourceTransactionManager dataSourceTransactionManager, TransactionStatus transactionStatus) {
        this.mainService = mainService;
        this.dataSourceTransactionManager = dataSourceTransactionManager;
        this.transactionStatus = transactionStatus;
    }

    @Override
    public void invoke(BizBalanceMain bizBalanceMain, AnalysisContext analysisContext) {
        // 如果事务已经关闭
        if (transactionStatus.isCompleted()) {
            return;
        }
//        log.info("解析到一条数据:{}", JSONUtil.toJsonStr(bizBalanceMain));
        list.add(bizBalanceMain);
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
        log.info("所有账户余额数据解析完成！");
//        if (!transactionStatus.isCompleted()) {
//            // 提交事务
//            platformTransactionManager.commit(transactionStatus);
//        }
    }

    @Override
    public void onException(Exception exception, AnalysisContext context) throws Exception {
        dataSourceTransactionManager.rollback(transactionStatus);
        throw new RuntimeException("解析账户余额onException出错: " + exception.getMessage());
    }

    private void saveData() {
        try {
            mainService.doImport(list);
        } catch (Exception e) {
            dataSourceTransactionManager.rollback(transactionStatus);
            throw new RuntimeException("解析账户余额doImport出错: " + e.getMessage());
        }
    }
}
