package com.monezhao.modules.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysJobLog;
import com.monezhao.common.base.BaseService;

/**
 * 定时任务执行日志Service
 *
 * @author monezhao@163.com
 */
public interface SysJobLogService extends BaseService<SysJobLog> {
    /**
     * 分页查询定时任务执行日志
     *
     * @param page
     * @param sysJobLog
     * @return
     */
    IPage<SysJobLog> list(IPage<SysJobLog> page, SysJobLog sysJobLog);
}
