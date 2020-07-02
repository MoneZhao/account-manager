package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.common.base.BaseService;

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
}
