package com.monezhao.modules.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 代码信息Mapper
 *
 * @author monezhao@163.com
 */
public interface SysCodeInfoMapper extends BaseMapper<SysCodeInfo> {
    /**
     * 查询代码信息列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysCodeInfo> list(IPage<SysCodeInfo> page, @Param("entity") SysCodeInfo entity);
}
