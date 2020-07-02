package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.base.BaseService;


/**
 * 系统日志Service
 *
 * @author monezhao@163.com
 */
public interface SysLogService extends BaseService<SysLog> {
    /**
     * 分页查询系统日志
     *
     * @param page
     * @param sysLog
     * @return
     */
    IPage<SysLog> list(IPage<SysLog> page, SysLog sysLog);
}
