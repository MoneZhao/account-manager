package com.monezhao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysTravelExpense;

/**
 * 出差报销Mapper
 *
 * @author monezhao@163.com
 */

@Mapper
public interface SysTravelExpenseMapper extends BaseMapper<SysTravelExpense> {
    /**
     * 查询出差报销列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysTravelExpense> list(IPage<SysTravelExpense> page, @Param("entity") SysTravelExpense entity);
}
