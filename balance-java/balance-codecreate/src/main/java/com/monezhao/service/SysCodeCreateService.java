package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeCreate;
import com.monezhao.common.base.BaseService;

/**
 * 代码在线生成Service
 *
 * @author monezhao@163.com
 */
public interface SysCodeCreateService extends BaseService<SysCodeCreate> {
    /**
     * 分页查询代码在线生成
     *
     * @param page
     * @param sysCodeCreate
     * @return
     */
    IPage<SysCodeCreate> list(IPage<SysCodeCreate> page, SysCodeCreate sysCodeCreate);
}
