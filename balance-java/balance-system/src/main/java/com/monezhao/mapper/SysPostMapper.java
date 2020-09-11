package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysPost;
import com.monezhao.bean.sys.SysPostUser;
import com.monezhao.bean.sys.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 岗位Mapper
 *
 * @author monezhao@163.com
 */
public interface SysPostMapper extends BaseMapper<SysPost> {
    /**
     * 查询岗位列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysPost> list(IPage<SysPost> page, @Param("entity") SysPost entity);

    /**
     * 查询岗位用户列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysUser> getPostUser(IPage<SysUser> page, @Param("entity") SysPostUser entity);
}
