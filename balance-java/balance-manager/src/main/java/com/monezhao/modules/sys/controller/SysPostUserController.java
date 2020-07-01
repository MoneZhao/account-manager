package com.monezhao.modules.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.modules.sys.service.SysPostUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
import java.util.Arrays;

/**
 * 岗位和用户关系Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/postUser")
@Api(tags = "岗位和用户关系")
public class SysPostUserController extends BaseController {
    @Autowired
    private SysPostUserService sysPostUserService;

    /**
     * 自定义查询列表
     *
     * @param sysPostUser
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:postUser:list")
    @GetMapping(value = "/list")
    @ApiOperation("岗位和用户关系列表")
    public Result list(SysPostUser sysPostUser, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysPostUser> pageList = sysPostUserService.list(new Page<SysPostUser>(current, size), sysPostUser);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:postUser:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("岗位和用户关系查询")
    public Result queryById(@RequestParam String id) {
        SysPostUser sysPostUser = sysPostUserService.getById(id);
        return Result.ok(sysPostUser);
    }

    /**
     * @param sysPostUser
     * @return
     * @功能：新增
     */
    @RequiresPermissions("sys:postUser:save")
    @PostMapping(value = "/save")
    @ApiOperation("岗位和用户关系新增")
    public Result save(@Valid @RequestBody SysPostUser sysPostUser) {
        sysPostUserService.save(sysPostUser);
        return Result.ok();
    }

    /**
     * @param sysPostUser
     * @return
     * @功能：修改
     */
    @RequiresPermissions("sys:postUser:update")
    @PutMapping(value = "/update")
    @ApiOperation("岗位和用户关系修改")
    public Result update(@Valid @RequestBody SysPostUser sysPostUser) {
        sysPostUserService.updateById(sysPostUser);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:postUser:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("岗位和用户关系删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysPostUserService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysPostUserService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
