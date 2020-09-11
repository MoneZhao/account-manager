package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysPostUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 岗位和用户关系Mapper
 *
 * @author monezhao@163.com
 */
public interface SysPostUserMapper extends BaseMapper<SysPostUser> {
    /**
     * 查询岗位和用户关系列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysPostUser> list(IPage<SysPostUser> page, @Param("entity") SysPostUser entity);
}
