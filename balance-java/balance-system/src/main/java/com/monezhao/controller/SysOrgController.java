package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysOrg;
import com.monezhao.bean.utilsVo.ElTree;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.permission.provider.OrgDataPermissionProvider;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.service.SysOrgService;
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
import java.util.List;

/**
 * 机构Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/org")
@Api(tags = "机构")
@ApiSupport(author = "monezhao@163.com")
public class SysOrgController extends BaseController {
    @Autowired
    private SysOrgService sysOrgService;

    /**
     * 自定义查询列表
     *
     * @param baseOrg
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:org:list")
    @GetMapping(value = "/list")
    @ApiOperation("机构列表")
    public Result list(SysOrg baseOrg, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysOrg> pageList = sysOrgService.list(new Page<>(current, size), baseOrg);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:org:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("机构查询")
    public Result queryById(@RequestParam String id) {
        SysOrg baseOrg = sysOrgService.getById(id);
        return Result.ok(baseOrg);
    }

    /**
     * @param baseOrg
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增机构")
    @RequiresPermissions("sys:org:save")
    @PostMapping(value = "/save")
    @ApiOperation("机构新增")
    @ApiOperationSupport(ignoreParameters = {
            "orgId",
    })
    public Result save(@Valid @RequestBody SysOrg baseOrg) {
        sysOrgService.saveBaseOrg(baseOrg);
        return Result.ok(baseOrg);
    }

    /**
     * @param baseOrg
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改机构")
    @RequiresPermissions("sys:org:update")
    @PutMapping(value = "/update")
    @ApiOperation("机构修改")
    public Result update(@Valid @RequestBody SysOrg baseOrg) {
        sysOrgService.updateBaseOrg(baseOrg);
        return Result.ok(baseOrg);
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除机构")
    @RequiresPermissions("sys:org:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("机构删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysOrgService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysOrgService.removeById(idsArr[0]);
        }
        return Result.ok();
    }

    /**
     * 机构管理，机构树数据
     *
     * @return
     */
    @RequiresPermissions("sys:org:getTreeData")
    @GetMapping(value = "/getTreeData")
    @ApiOperation("机构树数据")
    public Result getTreeData() {
        List<ElTree> treeData = sysOrgService.getTreeData();
        return Result.ok(treeData);
    }

    /**
     * 公共机构选择树
     *
     * @return
     */
    @GetMapping(value = "/getSelectTreeData")
    @ApiOperation("公共机构选择树")
    public Result getSelectTreeData(String type) {
        // 默认type=1
        type = CommonUtil.isEmptyDefault(type, "1");
        List<SysOrg> orgList = null;
        if (OrgDataPermissionProvider.TYPE_1.equals(type)) {
            orgList = sysOrgService.listOrgDataPermission1(new SysOrg());
        } else if (OrgDataPermissionProvider.TYPE_2.equals(type)) {
            orgList = sysOrgService.listOrgDataPermission2(new SysOrg());
        } else if (OrgDataPermissionProvider.TYPE_3.equals(type)) {
            orgList = sysOrgService.listOrgDataPermission3(new SysOrg());
        } else {
            throw new SysException("参数错误[type=" + type + "]");
        }
        List<ElTree> treeData = sysOrgService.makeOrgTree(orgList);
        return Result.ok(treeData);
    }
}
