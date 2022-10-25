package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 账户明细Mapper
 *
 * @author monezhao@163.com
 */

@Mapper
public interface SysBalanceDetailMapper extends BaseMapper<SysBalanceDetail> {
    /**
     * 查询账户明细列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysBalanceDetail> list(IPage<SysBalanceDetail> page, @Param("entity") SysBalanceDetail entity);

    /**
     * 查询用户账户总额
     *
     * @param id
     * @return
     */
    BigDecimal account(@Param("id") String id, @Param("userId") String userId);

    /**
     * 导出当前页明细列表
     *
     * @param mainIds 账户余额表id
     * @param mainIds 用户id
     * @return
     */
    List<SysBalanceDetail> listExport(@Param("list") List<String> mainIds, @Param("userId") String userId);

    /**
     * 根据id物理删除账户明细
     *
     * @param detailIds
     * @return
     */
    boolean deleteDetailIds(@Param("list") List<String> detailIds);

    /**
     * 报表查询列表
     */
    List<SysBalanceDetail> queryDetail(String userId, Date startMonth, Date endMonth, String balanceType);

    /**
     * 查询用户删除列表
     */
    void restore(@Param("list") List<String> idsArr);
}
