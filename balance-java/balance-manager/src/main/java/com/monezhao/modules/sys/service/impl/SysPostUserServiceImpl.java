package com.monezhao.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.modules.sys.mapper.SysPostUserMapper;
import com.monezhao.modules.sys.service.SysPostUserService;
import org.springframework.stereotype.Service;

/**
 * 岗位和用户关系Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysPostUserServiceImpl extends BaseServiceImpl<SysPostUserMapper, SysPostUser>
        implements SysPostUserService {
    @Override
    public IPage<SysPostUser> list(IPage<SysPostUser> page, SysPostUser sysPostUser) {
        return page.setRecords(baseMapper.list(page, sysPostUser));
    }
}
