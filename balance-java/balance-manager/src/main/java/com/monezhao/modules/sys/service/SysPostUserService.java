package com.monezhao.modules.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.common.base.BaseService;

/**
 * 岗位和用户关系Service
 *
 * @author monezhao@163.com
 */
public interface SysPostUserService extends BaseService<SysPostUser> {
    /**
     * 分页查询岗位和用户关系
     *
     * @param page
     * @param sysPostUser
     * @return
     */
    IPage<SysPostUser> list(IPage<SysPostUser> page, SysPostUser sysPostUser);
}
