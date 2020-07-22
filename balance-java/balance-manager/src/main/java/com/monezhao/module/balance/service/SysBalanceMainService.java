package com.monezhao.module.balance.service;

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
     * 导入账户余额
     *
     * @param list
     * @return
     */
    boolean doImport(List<SysBalanceMain> list);

}
