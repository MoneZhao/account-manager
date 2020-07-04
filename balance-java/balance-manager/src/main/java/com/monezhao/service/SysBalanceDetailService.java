package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseService;

import java.util.List;

/**
 * 账户明细Service
 *
 * @author monezhao@163.com
 */
public interface SysBalanceDetailService extends BaseService<SysBalanceDetail> {
    /**
     * 分页查询账户明细
     *
     * @param page
     * @param sysBalanceDetail
     * @return
     */
    IPage<SysBalanceDetail> list(IPage<SysBalanceDetail> page, SysBalanceDetail sysBalanceDetail);

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
     * 分页查询账户余额
     *
     * @param list
     * @return
     */
    boolean doImport(List<SysBalanceMain> list);
}
