package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysConstants;
import com.monezhao.bean.sys.SysOrg;
import com.monezhao.bean.utilsVo.ElTree;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.mapper.SysOrgMapper;
import com.monezhao.service.SysOrgService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 机构Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysOrgServiceImpl extends BaseServiceImpl<SysOrgMapper, SysOrg> implements SysOrgService {
    @Override
    public IPage<SysOrg> list(IPage<SysOrg> page, SysOrg baseOrg) {
        return page.setRecords(baseMapper.list(page, baseOrg));
    }

    /**
     * 查询机构数据权限
     * <p>
     * type=1
     *
     * @param baseOrg
     * @return
     */
    @Override
    public List<SysOrg> listOrgDataPermission1(SysOrg baseOrg) {
        return baseMapper.list(null, baseOrg);
    }

    /**
     * 查询机构数据权限
     * <p>
     * type=2
     *
     * @param baseOrg
     * @return
     */
    @Override
    public List<SysOrg> listOrgDataPermission2(SysOrg baseOrg) {
        return baseMapper.list(null, baseOrg);
    }

    /**
     * 查询机构数据权限
     * <p>
     * type=2
     *
     * @param baseOrg
     * @return
     */
    @Override
    public List<SysOrg> listOrgDataPermission3(SysOrg baseOrg) {
        return baseMapper.list(null, baseOrg);
    }

    /**
     * 新增机构，自动计算机构级别、机构级次码、是否叶子
     *
     * @param baseOrg
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean saveBaseOrg(SysOrg baseOrg) {
        // 【1】 校验id是否重复.
        if (CommonUtil.isEmptyStr(baseOrg.getParentOrgId())) {
            throw new SysException("保存失败,请先选择上级机构!");
        }
        // 父节点
        SysOrg parentBaseOrg = this.getById(baseOrg.getParentOrgId());
        if (parentBaseOrg == null) {
            throw new SysException("保存失败,上级机构ID【" + baseOrg.getParentOrgId() + "】不存在!");
        }
        // 【2】计算机构级次,机构级次码
        // 【2-a】设置新增机构的父机构是否叶子为否
        if (!SysConstants.IS_LEAF_0.equals(parentBaseOrg.getIsLeaf())) {
            parentBaseOrg.setIsLeaf(SysConstants.IS_LEAF_0);
            this.updateById(parentBaseOrg);
        }
        Integer orgLevel = Integer.valueOf(parentBaseOrg.getOrgLevel()) + 1;
        baseOrg.setOrgLevel(orgLevel.toString());
        baseOrg.setOrgLevelCode(parentBaseOrg.getOrgLevelCode() + "," + baseOrg.getOrgId());

        // 【3】设置新增机构是否叶子为 是；
        baseOrg.setIsLeaf(SysConstants.IS_LEAF_1);
        return this.save(baseOrg);
    }

    /**
     * 修改机构，自动计算机构级别、机构级次码、是否叶子
     *
     * @param newOrg
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateBaseOrg(SysOrg newOrg) {
        if (CommonUtil.isEmptyStr(newOrg.getParentOrgId())) {
            newOrg.setOrgLevel("1");
            newOrg.setOrgLevelCode(newOrg.getOrgId());
            return this.updateById(newOrg);
        }

        //更改前的节点
        SysOrg oldOrg = this.getById(newOrg.getOrgId());
        if (Objects.equals(oldOrg.getParentOrgId(), newOrg.getParentOrgId())) {
            return this.updateById(newOrg);
        }
        // 新父节点
        SysOrg newParentOrg = this.getById(newOrg.getParentOrgId());
        if (newParentOrg == null) {
            throw new SysException("保存失败,上级机构ID【" + newOrg.getParentOrgId() + "】不存在!");
        }

        List<SysOrg> orgList = baseMapper.list(null, new SysOrg());
        Map<String, ElTree> orgMap = getTreeMap(orgList);

        // 【2】计算机构级次,机构级次码
        // 【2-a】设置机构的新父机构是否叶子为否
        if (!SysConstants.IS_LEAF_0.equals(newParentOrg.getIsLeaf())) {
            newParentOrg.setIsLeaf(SysConstants.IS_LEAF_0);
            this.updateById(newParentOrg);
        }

        // 【2-b】判断机构的旧父机构是否还有节点
        ElTree oldParentTree = orgMap.get(oldOrg.getParentOrgId());
        if (oldParentTree.getChildren().size() <= 1) {
            //是叶子
            SysOrg oldParentOrg = (SysOrg) (oldParentTree.getData());
            oldParentOrg.setIsLeaf(SysConstants.IS_LEAF_1);
            this.updateById(oldParentOrg);
        }
        //设置机构的子机构level
        List<SysOrg> sysOrgs = updateChildrenOrg(
                orgMap.get(newOrg.getOrgId()),
                new ArrayList<>(),
                Integer.parseInt(newParentOrg.getOrgLevel()),
                newParentOrg.getOrgLevelCode()
        );
        sysOrgs.set(0, newOrg);
        return this.updateBatchById(sysOrgs);
    }

    /**
     * 机构管理，机构树数据
     *
     * @return
     */
    @Override
    public List<ElTree> getTreeData() {
        List<SysOrg> orgList = baseMapper.list(null, new SysOrg());
        return makeOrgTree(orgList);
    }

    /**
     * 生成机构树
     *
     * @param orgList
     * @return
     */
    @Override
    public List<ElTree> makeOrgTree(List<SysOrg> orgList) {
        List<ElTree> result = new ArrayList<>();
        getTreeMap(orgList).forEach((k, v) -> {
            if (CommonUtil.isEmptyStr(v.getParentId())) {
                result.add(v);
            }
        });
        return result;
    }

    private Map<String, ElTree> getTreeMap(List<SysOrg> orgList) {
        Map<String, ElTree> orgMap = new LinkedHashMap<>();
        for (SysOrg baseOrg : orgList) {
            ElTree elTree = new ElTree();
            elTree.setId(baseOrg.getOrgId());
            elTree.setLabel(baseOrg.getOrgName());
            elTree.setIsLeaf(SysConstants.IS_LEAF_1.equals(baseOrg.getIsLeaf()));
            elTree.setData(baseOrg);
            orgMap.put(baseOrg.getOrgId(), elTree);
            if (CommonUtil.isNotEmptyStr(baseOrg.getParentOrgId()) && orgMap.containsKey(baseOrg.getParentOrgId())) {
                elTree.setParentId(baseOrg.getParentOrgId());
                ElTree parentElTree = orgMap.get(baseOrg.getParentOrgId());
                parentElTree.addChildren(elTree);
            }
        }
        return orgMap;
    }

    private List<SysOrg> updateChildrenOrg(ElTree newOrgTree, List<SysOrg> list, Integer parentLevel, String parentLevelCode) {
        SysOrg newOrg = (SysOrg) newOrgTree.getData();
        newOrg.setOrgLevel(Integer.toString(parentLevel + 1));
        newOrg.setOrgLevelCode(parentLevelCode + "," + newOrg.getOrgId());
        list.add(newOrg);
        if (newOrgTree.getChildren() != null && !newOrgTree.getChildren().isEmpty()) {
            for (ElTree child : newOrgTree.getChildren()) {
                updateChildrenOrg(child, list, Integer.parseInt(newOrg.getOrgLevel()), newOrg.getOrgLevelCode());
            }
        }
        return list;
    }
}
