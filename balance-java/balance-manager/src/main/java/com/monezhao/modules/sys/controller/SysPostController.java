package com.monezhao.modules.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysPost;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.modules.sys.service.SysPostService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * 岗位Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/post")
public class SysPostController extends BaseController {
    @Autowired
    private SysPostService sysPostService;

    /**
     * 自定义查询列表
     *
     * @param sysPost
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:post:list")
    @GetMapping(value = "/list")
    public Result list(SysPost sysPost, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysPost> pageList = sysPostService.list(new Page<SysPost>(current, size), sysPost);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:post:list")
    @GetMapping(value = "/queryById")
    public Result queryById(@RequestParam String id) {
        SysPost sysPost = sysPostService.getById(id);
        return Result.ok(sysPost);
    }

    /**
     * @param sysPost
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:post:save")
    @PostMapping(value = "/save")
    public Result save(@Valid @RequestBody SysPost sysPost) {
        sysPostService.save(sysPost);
        return Result.ok();
    }

    /**
     * @param sysPost
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:post:update")
    @PutMapping(value = "/update")
    public Result update(@Valid @RequestBody SysPost sysPost) {
        sysPostService.updateById(sysPost);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:post:delete")
    @DeleteMapping(value = "/delete")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        this.sysPostService.delete(ids);
        return Result.ok();
    }

    /**
     * 获取岗位用户
     *
     * @param sysPostUser
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:post:getPostUser")
    @GetMapping(value = "/getPostUser")
    public Result getPostUser(SysPostUser sysPostUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysUser> pageList = this.sysPostService.getPostUser(new Page<SysUser>(current, size), sysPostUser);
        return Result.ok(pageList);
    }

    /**
     * 保存岗位用户
     *
     * @param sysPostUser
     * @return
     */
    @SysLogAuto(value = "保存岗位用户")
    @RequiresPermissions("sys:post:savePostUsers")
    @PostMapping(value = "/savePostUsers")
    public Result savePostUsers(@RequestBody SysPostUser sysPostUser) {
        this.sysPostService.savePostUsers(sysPostUser.getPostId(), sysPostUser.getUserId());
        return Result.ok();
    }

    /**
     * 删除岗位用户
     *
     * @param postId
     * @param userIds
     * @return
     */
    @SysLogAuto(value = "删除岗位用户")
    @RequiresPermissions("sys:post:deletePostUsers")
    @DeleteMapping(value = "/deletePostUsers")
    public Result deletePostUsers(String postId, String userIds) {
        this.sysPostService.deletePostUsers(postId, userIds);
        return Result.ok();
    }
}
