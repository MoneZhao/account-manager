package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeCreate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 代码在线生成Mapper
 *
 * @author monezhao@163.com
 */
@Mapper
public interface SysCodeCreateMapper extends BaseMapper<SysCodeCreate> {
    /**
     * 查询代码在线生成列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysCodeCreate> list(IPage<SysCodeCreate> page, @Param("entity") SysCodeCreate entity);
}
