package com.monezhao.module.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.module.sys.mapper.SysLogMapper;
import com.monezhao.module.sys.service.SysLogService;
import org.springframework.stereotype.Service;

/**
 * 系统日志Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysLogServiceImpl extends BaseServiceImpl<SysLogMapper, SysLog>
        implements SysLogService {
    @Override
    public IPage<SysLog> list(IPage<SysLog> page, SysLog sysLog) {
        return page.setRecords(baseMapper.list(page, sysLog));
    }
}
