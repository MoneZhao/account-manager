package com.monezhao.module.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 代码类别Mapper
 *
 * @author monezhao@163.com
 */
public interface SysCodeTypeMapper extends BaseMapper<SysCodeType> {
    /**
     * 查询代码类别列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysCodeType> list(IPage<SysCodeType> page, @Param("entity") SysCodeType entity);
}
