package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysMenu;
import com.monezhao.bean.sys.SysRole;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SysRolePermissionVO;
import com.monezhao.controller.command.VisitCount;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户Mapper
 *
 * @author monezhao@163.com
 */
public interface SysUserMapper extends BaseMapper<SysUser> {
    /**
     * 查询用户列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysUser> list(IPage<SysUser> page, @Param("entity") SysUser entity);

    /**
     * 根据用户Id查询角色列表
     *
     * @param userId
     * @return
     */
    public List<SysRole> getRolesByUserId(@Param("userId") String userId);

    /**
     * 查询所有权限清单
     *
     * @return
     */
    public List<SysRolePermissionVO> getAdminPermissions();

    /**
     * 根据角色Id查询角色权限清单
     *
     * @param roleId
     * @return
     */
    public List<SysRolePermissionVO> getRolePermissions(@Param("roleId") String roleId);

    /**
     * 根据角色Id查询菜单列表
     *
     * @param roleId
     * @return
     */
    public List<SysMenu> getRoleMenus(@Param("roleId") String roleId);

    /**
     * 总访问量
     *
     * @return
     */
    long findTotalVisitCount();

    /**
     * 今日访问量
     *
     * @return
     */
    long findTodayVisitCount();

    /**
     * 今日IP
     *
     * @return
     */
    long findTodayIp();

    /**
     * 近7日访问量
     *
     * @param username 用户名
     * @return
     */
    List<VisitCount> findLastSevenDaysVisitCount(String username);

    /**
     * 查询角色授权菜单
     *
     * @param roleId
     * @return
     */
    List<SysMenu> listMenuByRoleId(String roleId);

    /**
     * 查询用户快捷方式
     *
     * @param userId
     * @return
     */
    List<String> listPermissionsByUserId(String userId);
}
