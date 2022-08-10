package com.monezhao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceCount;

/**
 * 计入总资产Mapper
 *
 * @author monezhao@163.com
 */

@Mapper
public interface SysBalanceCountMapper extends BaseMapper<SysBalanceCount> {
    /**
     * 查询计入总资产列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysBalanceCount> list(IPage<SysBalanceCount> page, @Param("entity") SysBalanceCount entity);
}
