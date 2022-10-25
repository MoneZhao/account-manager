package com.monezhao.service;

import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseService;
import org.apache.ibatis.annotations.Param;

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

    /**
     * 判断数据日期重复
     *
     * @param sysBalanceMain sysBalanceMain
     * @return
     */
    boolean exist(SysBalanceMain sysBalanceMain);

    /**
     * 查询用户删除列表
     */
    void restore(@Param("list") List<String> idsArr);

}
