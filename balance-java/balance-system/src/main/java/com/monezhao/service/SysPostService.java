package com.monezhao.service;

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
