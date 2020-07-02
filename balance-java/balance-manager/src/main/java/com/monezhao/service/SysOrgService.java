package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysOrg;
import com.monezhao.bean.utilsVo.ElTree;
import com.monezhao.common.base.BaseService;

import java.util.List;

/**
 * 机构Service
 *
 * @author monezhao@163.com
 */
public interface SysOrgService extends BaseService<SysOrg> {
    /**
     * 分页查询机构
     *
     * @param page
     * @param baseOrg
     * @return
     */
    IPage<SysOrg> list(IPage<SysOrg> page, SysOrg baseOrg);

    /**
     * 查询机构数据权限
     * <p>
     * type=1
     *
     * @param baseOrg
     * @return
     */
    List<SysOrg> listOrgDataPermission1(SysOrg baseOrg);

    /**
     * 查询机构数据权限
     * <p>
     * type=2
     *
     * @param baseOrg
     * @return
     */
    List<SysOrg> listOrgDataPermission2(SysOrg baseOrg);

    /**
     * 查询机构数据权限
     * <p>
     * type=2
     *
     * @param baseOrg
     * @return
     */
    List<SysOrg> listOrgDataPermission3(SysOrg baseOrg);

    /**
     * 新增机构，自动计算机构级别、机构级次码、是否叶子
     *
     * @param baseOrg
     * @return
     */
    boolean saveBaseOrg(SysOrg baseOrg);

    /**
     * 修改机构，自动计算机构级别、机构级次码、是否叶子
     *
     * @param baseOrg
     * @return
     */
    boolean updateBaseOrg(SysOrg baseOrg);

    /**
     * 机构管理，机构树数据
     *
     * @return
     */
    List<ElTree> getTreeData();

    /**
     * 生成机构树
     *
     * @param orgList
     * @return
     */
    List<ElTree> makeOrgTree(List<SysOrg> orgList);
}
