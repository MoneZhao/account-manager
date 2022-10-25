package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceMain;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 账户余额主Mapper
 *
 * @author monezhao@163.com
 */

@Mapper
public interface SysBalanceMainMapper extends BaseMapper<SysBalanceMain> {
    /**
     * 查询账户余额列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysBalanceMain> list(IPage<SysBalanceMain> page, @Param("entity") SysBalanceMain entity);

    /**
     * 根据id物理删除账户余额
     *
     * @param mainIds
     * @return
     */
    boolean deleteMainIds(@Param("list") List<String> mainIds);

    /**
     * 查询用户删除列表
     */
    void restore(List<String> idsArr);
}
