package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单Mapper
 *
 * @author monezhao@163.com
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    /**
     * 查询菜单列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysMenu> list(IPage<SysMenu> page, @Param("entity") SysMenu entity);
}
