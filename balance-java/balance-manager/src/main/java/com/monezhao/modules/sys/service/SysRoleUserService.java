package com.monezhao.modules.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRoleUser;
import com.monezhao.common.base.BaseService;

/**
 * 角色和用户关系Service
 *
 * @author monezhao@163.com
 */
public interface SysRoleUserService extends BaseService<SysRoleUser> {
    /**
     * 分页查询角色和用户关系
     *
     * @param page
     * @param sysRoleUser
     * @return
     */
    IPage<SysRoleUser> list(IPage<SysRoleUser> page, SysRoleUser sysRoleUser);
}
