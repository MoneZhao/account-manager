package com.monezhao.module.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRoleUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色和用户关系Mapper
 *
 * @author monezhao@163.com
 */
public interface SysRoleUserMapper extends BaseMapper<SysRoleUser> {
    /**
     * 查询角色和用户关系列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysRoleUser> list(IPage<SysRoleUser> page, @Param("entity") SysRoleUser entity);
}