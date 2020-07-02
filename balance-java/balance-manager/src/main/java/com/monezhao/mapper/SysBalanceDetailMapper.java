package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 账户明细Mapper
 *
 * @author monezhao@163.com
 */
public interface SysBalanceDetailMapper extends BaseMapper<SysBalanceDetail> {
    /**
     * 查询账户明细列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysBalanceDetail> list(IPage<SysBalanceDetail> page, @Param("entity") SysBalanceDetail entity);

    /**
     * 查询用户账户总额
     *
     * @param id
     * @return
     */
    public Double account(@Param("id") String id);
}
