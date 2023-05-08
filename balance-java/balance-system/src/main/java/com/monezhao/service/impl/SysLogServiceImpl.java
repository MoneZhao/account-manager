package com.monezhao.service.impl;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.read.metadata.ReadSheet;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.excel.UploadSysLogListener;
import com.monezhao.mapper.SysLogMapper;
import com.monezhao.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 系统日志Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysLogServiceImpl extends BaseServiceImpl<SysLogMapper, SysLog>
        implements SysLogService {

    @Autowired
    private DataSourceTransactionManager dataSourceTransactionManager;

    @Autowired
    private TransactionDefinition transactionDefinition;

    @Override
    public IPage<SysLog> list(IPage<SysLog> page, SysLog sysLog) {
        List<SysLog> records = baseMapper.list(page, sysLog);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    @Override
    @Async
    public void importManager(MultipartFile file) throws IOException {
        ExcelReader excelReader = EasyExcel.read(file.getInputStream()).build();
        ReadSheet readSheet = EasyExcel.readSheet(0).head(SysLog.class).
                registerReadListener(
                        new UploadSysLogListener(this, dataSourceTransactionManager, transactionDefinition)
                ).build();
        excelReader.read(readSheet);
        excelReader.finish();
    }

    @Override
    public void doImport(List<SysLog> list) {
        this.saveOrUpdateBatch(list);
    }
}
