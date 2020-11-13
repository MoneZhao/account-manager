package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysJob;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 定时任务Mapper
 *
 * @author monezhao@163.com
 */

@Mapper
public interface SysJobMapper extends BaseMapper<SysJob> {
    /**
     * 查询定时任务列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysJob> list(IPage<SysJob> page, @Param("entity") SysJob entity);
}
