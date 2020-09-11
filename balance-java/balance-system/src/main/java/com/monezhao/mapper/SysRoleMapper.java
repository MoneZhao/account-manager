package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRole;
import com.monezhao.bean.sys.SysRoleUser;
import com.monezhao.bean.sys.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色Mapper
 *
 * @author monezhao@163.com
 */
public interface SysRoleMapper extends BaseMapper<SysRole> {
    /**
     * 查询角色列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysRole> list(IPage<SysRole> page, @Param("entity") SysRole entity);

    /**
     * 根据角色I点查询菜单按钮列表
     *
     * @param roleId
     * @return
     */
    public List<String> listMenuOrFuncIdsByRoleId(String roleId);

    /**
     * 查询角色用户列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysUser> getRoleUser(IPage<SysUser> page, @Param("entity") SysRoleUser entity);
}
