package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 操作权限Mapper
 *
 * @author monezhao@163.com
 */
public interface SysRolePermissionMapper extends BaseMapper<SysRolePermission> {
    /**
     * 查询操作权限列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysRolePermission> list(IPage<SysRolePermission> page, @Param("entity") SysRolePermission entity);
}
