package com.monezhao.module.sys.service;

import com.monezhao.bean.sys.SysMenu;
import com.monezhao.bean.utilsVo.ElTree;
import com.monezhao.common.base.BaseService;

import java.util.List;

/**
 * 菜单Service
 *
 * @author monezhao@163.com
 */
public interface SysMenuService extends BaseService<SysMenu> {

    /**
     * 新增菜单，自动计算是否叶子
     *
     * @param sysMenu
     * @return
     */
    boolean saveSysMenu(SysMenu sysMenu);

    /**
     * 修改菜单
     *
     * @param sysMenu
     * @return
     */
    boolean updateSysMenu(SysMenu sysMenu);

    /**
     * 删除菜单
     *
     * @param id
     * @return
     */
    boolean delete(String id);

    /**
     * 菜单管理，菜单树数据
     *
     * @return
     */
    List<ElTree> getTreeData();
}
