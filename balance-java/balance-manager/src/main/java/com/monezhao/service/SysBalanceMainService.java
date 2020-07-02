package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseService;

import java.util.List;

/**
 * 账户余额主Service
 *
 * @author monezhao@163.com
 */
public interface SysBalanceMainService extends BaseService<SysBalanceMain> {
    /**
     * 分页查询账户余额
     *
     * @param page
     * @param sysBalanceMain
     * @return
     */
    IPage<SysBalanceMain> list(IPage<SysBalanceMain> page, SysBalanceMain sysBalanceMain);

    /**
     * 分页查询账户余额
     *
     * @param ids
     * @return
     */
    boolean delete(List<String> ids);
}
