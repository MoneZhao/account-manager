package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysRoleUser;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.SysRoleUserMapper;
import com.monezhao.service.SysRoleUserService;
import org.springframework.stereotype.Service;

/**
 * 角色和用户关系Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysRoleUserServiceImpl extends BaseServiceImpl<SysRoleUserMapper, SysRoleUser>
        implements SysRoleUserService {
    @Override
    public IPage<SysRoleUser> list(IPage<SysRoleUser> page, SysRoleUser sysRoleUser) {
        return page.setRecords(baseMapper.list(page, sysRoleUser));
    }
}