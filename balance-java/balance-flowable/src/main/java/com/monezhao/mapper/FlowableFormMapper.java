package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.flowable.FlowableForm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 流程表单Mapper
 *
 * @author monezhao@163.com
 */
public interface FlowableFormMapper extends BaseMapper<FlowableForm> {
    /**
     * 查询流程表单列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<FlowableForm> list(IPage<FlowableForm> page, @Param("entity") FlowableForm entity);
}
