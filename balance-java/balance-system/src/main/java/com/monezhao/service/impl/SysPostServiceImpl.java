package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysPost;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.permission.FilterOperate;
import com.monezhao.common.query.QueryWrapperGenerator;
import com.monezhao.mapper.SysPostMapper;
import com.monezhao.service.SysPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;

/**
 * 岗位Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysPostServiceImpl extends BaseServiceImpl<SysPostMapper, SysPost> implements SysPostService {
    @Autowired
    private SysPostUserServiceImpl sysPostUserService;

    @Override
    public IPage<SysPost> list(IPage<SysPost> page, SysPost sysPost) {
        return page.setRecords(baseMapper.list(page, sysPost));
    }

    /**
     * 查询岗位用户
     *
     * @param page
     * @param sysPostUser
     * @return
     */
    @Override
    public IPage<SysUser> getPostUser(Page<SysUser> page, SysPostUser sysPostUser) {
        return page.setRecords(baseMapper.getPostUser(page, sysPostUser));
    }

    /**
     * 保存岗位用户
     *
     * @param postId
     * @param userIds
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void savePostUsers(String postId, String userIds) {
        String[] userIdArray = userIds.split(",");
        // 【1】先删除岗位用户
        QueryWrapper<SysPostUser> queryWrapper = new QueryWrapper<>();
        QueryWrapperGenerator.addEasyQuery(queryWrapper, "postId", FilterOperate.EQ, postId);
        QueryWrapperGenerator.addEasyQuery(queryWrapper, "userId", FilterOperate.IN, userIdArray);
        sysPostUserService.remove(queryWrapper);

        // 【2】保存岗位用户
        for (int i = 0; i < userIdArray.length; i++) {
            SysPostUser sysPostUser = new SysPostUser();
            sysPostUser.setPostId(postId);
            sysPostUser.setUserId(userIdArray[i]);
            sysPostUserService.save(sysPostUser);
        }
    }

    /**
     * 删除岗位用户
     *
     * @param postId
     * @param userIds
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deletePostUsers(String postId, String userIds) {
        String[] userIdArray = userIds.split(",");
        QueryWrapper<SysPostUser> queryWrapper = new QueryWrapper<>();
        QueryWrapperGenerator.addEasyQuery(queryWrapper, "postId", FilterOperate.EQ, postId);
        QueryWrapperGenerator.addEasyQuery(queryWrapper, "userId", FilterOperate.IN, userIdArray);
        sysPostUserService.remove(queryWrapper);
    }

    /**
     * 删除岗位
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(String ids) {
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            this.removeByIds(Arrays.asList(idsArr));
        } else {
            this.removeById(idsArr[0]);
        }
        sysPostUserService.remove(new QueryWrapper<SysPostUser>().in("post_id", idsArr));
    }
}
