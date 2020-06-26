package com.monezhao.modules.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysPost;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.base.BaseService;

/**
 * 岗位Service
 *
 * @author monezhao@163.com
 */
public interface SysPostService extends BaseService<SysPost> {

    /**
     * 分页查询岗位
     *
     * @param page
     * @param sysPost
     * @return
     */
    IPage<SysPost> list(IPage<SysPost> page, SysPost sysPost);

    /**
     * 查询岗位用户
     *
     * @param page
     * @param sysPostUser
     * @return
     */
    IPage<SysUser> getPostUser(Page<SysUser> page, SysPostUser sysPostUser);

    /**
     * 保存岗位用户
     *
     * @param postId
     * @param userIds
     */
    void savePostUsers(String postId, String userIds);

    /**
     * 删除岗位用户
     *
     * @param postId
     * @param userIds
     */
    void deletePostUsers(String postId, String userIds);

    /**
     * 删除岗位
     *
     * @param ids
     */
    void delete(String ids);
}
