package com.monezhao.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.util.JacksonUtil;
import com.monezhao.service.SysBalanceMainService;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/7/2 5:31 下午
 */
@Slf4j
public class UploadSysBalanceMainListener extends AnalysisEventListener<SysBalanceMain> {

    private static final int BATCH_COUNT = 100;
    private final SysBalanceMainService mainService;
    List<SysBalanceMain> list = new ArrayList<>();

    public UploadSysBalanceMainListener(SysBalanceMainService mainService) {
        this.mainService = mainService;
    }

    @Override
    public void invoke(SysBalanceMain sysBalanceMain, AnalysisContext analysisContext) {
        log.info("解析到一条数据:{}", JacksonUtil.objToStr(sysBalanceMain));
        list.add(sysBalanceMain);
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
        mainService.doImport(list);
    }
}
