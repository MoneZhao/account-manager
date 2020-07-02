package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRole;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.to.VisitCount;
import com.monezhao.bean.utilsVo.Route;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.bean.utilsVo.SysPasswordForm;
import com.monezhao.common.base.BaseService;

import java.util.List;


/**
 * 用户Service
 *
 * @author monezhao@163.com
 */
public interface SysUserService extends BaseService<SysUser> {
    /**
     * 分页查询用户
     *
     * @param page
     * @param sysUser
     * @return
     */
    IPage<SysUser> list(IPage<SysUser> page, SysUser sysUser);

    /**
     * 公共选人查询
     *
     * @param page
     * @param sysUser
     * @return
     */
    IPage<SysUser> listSelectUser(IPage<SysUser> page, SysUser sysUser);

    /**
     * 根据用户id查询角色
     *
     * @param userId
     * @return
     */
    List<SysRole> getRoleByUserId(String userId);

    /**
     * 获取用户信息 ，若用户变更角色，则roleId不能为空,并且将变更后的roleId更新到T_SYS_USER表中
     *
     * @param sysUser
     * @param roleId
     * @return
     */
    SessionObject saveGetUserInfo(SysUser sysUser, String roleId);

    /**
     * 加载用户按钮权限
     *
     * @param sysUser
     * @param roleId
     * @param data
     * @return
     */
    SessionObject loadFuncIdsAndPermissions(SysUser sysUser, String roleId, SessionObject data);

    /**
     * 加载路由信息
     *
     * @param sysUser
     * @param roleId
     * @return
     */
    List<Route> loadRoutes(SysUser sysUser, String roleId);

    /**
     * 新增用户
     *
     * @param sysUser
     * @return
     */
    boolean saveSysUser(SysUser sysUser);

    /**
     * 修改用户
     *
     * @param sysUser
     * @return
     */
    boolean updateSysUser(SysUser sysUser);

    /**
     * 删除用户
     *
     * @param ids
     */
    void delete(String ids);

    /**
     * 修改密码
     *
     * @param sysPasswordForm
     * @return
     */
    boolean updatePassword(SysPasswordForm sysPasswordForm);

    /**
     * 重置密码
     *
     * @param userId
     * @return
     */
    void resetPassword(String userId);

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
}
