package com.monezhao.module.balance.service;

import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.common.base.BaseService;

import java.util.List;

/**
 * 账户明细Service
 *
 * @author monezhao@163.com
 */
public interface SysBalanceDetailService extends BaseService<SysBalanceDetail> {

    /**
     * 新增账户明细
     *
     * @param sysBalanceDetail
     * @return
     */
    @Override
    boolean save(SysBalanceDetail sysBalanceDetail);

    /**
     * 修改账户明细
     *
     * @param sysBalanceDetail
     * @return
     */
    boolean update(SysBalanceDetail sysBalanceDetail);

    /**
     * 删除账户明细
     *
     * @param idsArr
     * @return
     */
    boolean delete(String[] idsArr);

    /**
     * 删除账户余额
     *
     * @param idsArr
     * @return
     */
    boolean deleteMain(List<String> idsArr);

    /**
     * 导入账户明细
     *
     * @param list
     * @return
     */
    boolean doImport(List<SysBalanceDetail> list);

    /**
     * 导出当前页明细列表
     *
     * @param mainIds 账户余额表id
     * @param mainIds 用户id
     * @return
     */
    List<SysBalanceDetail> list(List<String> mainIds, String userId);
}