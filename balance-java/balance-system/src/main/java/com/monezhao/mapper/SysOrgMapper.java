package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysOrg;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 机构Mapper
 *
 * @author monezhao@163.com
 */
public interface SysOrgMapper extends BaseMapper<SysOrg> {
    /**
     * 查询机构列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<SysOrg> list(IPage<SysOrg> page, @Param("entity") SysOrg entity);
}
