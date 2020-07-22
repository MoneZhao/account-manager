package com.monezhao.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.common.util.JacksonUtil;
import com.monezhao.module.balance.service.SysBalanceDetailService;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/7/2 5:31 下午
 */
@Slf4j
public class UploadSysBalanceDetailListener extends AnalysisEventListener<SysBalanceDetail> {

    private static final int BATCH_COUNT = 100;

    List<SysBalanceDetail> list = new ArrayList<>();

    private SysBalanceDetailService detailService;

    public UploadSysBalanceDetailListener(SysBalanceDetailService detailService) {
        this.detailService = detailService;
    }

    @Override
    public void invoke(SysBalanceDetail sysBalanceDetail, AnalysisContext analysisContext) {
        log.info("解析到一条数据:{}", JacksonUtil.objToStr(sysBalanceDetail));
        list.add(sysBalanceDetail);
        if (list.size() >= BATCH_COUNT) {
            saveData();
            list.clear();
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        saveData();
        log.info("所有数据解析完成！");
    }

    private void saveData() {
        detailService.doImport(list);
    }
}
