package vip.xiaonuo.biz.modular.balancedetail.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionStatus;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.service.BizBalanceDetailService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2024/1/24 10:10
 */
@Slf4j
public class UploadSysBalanceDetailListener extends AnalysisEventListener<BizBalanceDetail> {

    private static final int BATCH_COUNT = 1000;
    private final BizBalanceDetailService detailService;
    List<BizBalanceDetail> list = new ArrayList<>();

    private DataSourceTransactionManager dataSourceTransactionManager;

    private TransactionStatus transactionStatus;

    public UploadSysBalanceDetailListener(BizBalanceDetailService detailService, DataSourceTransactionManager dataSourceTransactionManager,
                                          TransactionStatus transactionStatus) {
        this.detailService = detailService;
        this.dataSourceTransactionManager = dataSourceTransactionManager;
        this.transactionStatus = transactionStatus;
    }

    @Override
    public void invoke(BizBalanceDetail bizBalanceDetail, AnalysisContext analysisContext) {
        // 如果事务已经关闭
        if (transactionStatus.isCompleted()) {
            return;
        }
//        log.info("解析到一条数据:{}", JSONUtil.toJsonStr(bizBalanceDetail));
        list.add(bizBalanceDetail);
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
        log.info("所有账户详情数据解析完成！");
        if (!transactionStatus.isCompleted()) {
            // 提交事务
            dataSourceTransactionManager.commit(transactionStatus);
        }
    }

    @Override
    public void onException(Exception exception, AnalysisContext context) throws Exception {
        dataSourceTransactionManager.rollback(transactionStatus);
        log.info("解析账户详情出错");
        throw new RuntimeException("解析账户详情出错: " + exception.getMessage());
    }

    private void saveData() {
        try {
            detailService.doImport(list);
        } catch (Exception e) {
            dataSourceTransactionManager.rollback(transactionStatus);
            log.info("解析账户详情出错");
            throw new RuntimeException("解析账户详情出错: " + e.getMessage());
        }
    }

}
