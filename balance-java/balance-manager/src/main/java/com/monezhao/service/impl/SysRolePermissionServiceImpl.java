package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRolePermission;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.SysRolePermissionMapper;
import com.monezhao.service.SysRolePermissionService;
import org.springframework.stereotype.Service;

/**
 * 操作权限Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysRolePermissionServiceImpl extends BaseServiceImpl<SysRolePermissionMapper, SysRolePermission>
        implements SysRolePermissionService {
    @Override
    public IPage<SysRolePermission> list(IPage<SysRolePermission> page, SysRolePermission sysRolePermission) {
        return page.setRecords(baseMapper.list(page, sysRolePermission));
    }
}
