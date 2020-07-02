package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysFunc;
import com.monezhao.common.base.BaseService;

/**
 * 功能Service
 *
 * @author monezhao@163.com
 */
public interface SysFuncService extends BaseService<SysFunc> {
    /**
     * 分页查询功能
     *
     * @param page
     * @param sysFunc
     * @return
     */
    IPage<SysFunc> list(IPage<SysFunc> page, SysFunc sysFunc);
}
