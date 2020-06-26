package com.monezhao.modules.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRolePermission;
import com.monezhao.common.base.BaseService;

/**
 * 操作权限Service
 *
 * @author monezhao@163.com
 */
public interface SysRolePermissionService extends BaseService<SysRolePermission> {
    /**
     * 分页查询操作权限
     *
     * @param page
     * @param sysRolePermission
     * @return
     */
    IPage<SysRolePermission> list(IPage<SysRolePermission> page, SysRolePermission sysRolePermission);
}
