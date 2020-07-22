package com.monezhao.module.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysConfig;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 系统参数Mapper
 *
 * @author monezhao@163.com
 */
public interface SysConfigMapper extends BaseMapper<SysConfig> {
    /**
     * 查询系统参数列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysConfig> list(IPage<SysConfig> page, @Param("entity") SysConfig entity);
}
