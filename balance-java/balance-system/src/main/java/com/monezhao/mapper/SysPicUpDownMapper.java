package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysPicUpDown;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 图片上传下载Mapper
 *
 * @author monezhao@163.com
 */

@Mapper
public interface SysPicUpDownMapper extends BaseMapper<SysPicUpDown> {
    /**
     * 查询图片上传下载列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysPicUpDown> list(IPage<SysPicUpDown> page, @Param("entity") SysPicUpDown entity);
}
