package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysFunc;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 功能Mapper
 *
 * @author monezhao@163.com
 */
public interface SysFuncMapper extends BaseMapper<SysFunc> {
    /**
     * 查询功能列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysFunc> list(IPage<SysFunc> page, @Param("entity") SysFunc entity);
}
