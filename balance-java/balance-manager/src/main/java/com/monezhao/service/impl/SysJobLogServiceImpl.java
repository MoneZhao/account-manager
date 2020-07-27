package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysJobLog;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.SysJobLogMapper;
import com.monezhao.service.SysJobLogService;
import org.springframework.stereotype.Service;

/**
 * 定时任务执行日志Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysJobLogServiceImpl extends BaseServiceImpl<SysJobLogMapper, SysJobLog>
        implements SysJobLogService {
    @Override
    public IPage<SysJobLog> list(IPage<SysJobLog> page, SysJobLog sysJobLog) {
        return page.setRecords(baseMapper.list(page, sysJobLog));
    }
}
