package com.monezhao.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.flowable.FlowableForm;
import com.monezhao.common.base.BaseService;

/**
 * 流程表单Service
 *
 * @author monezhao@163.com
 */
public interface FlowableFormService extends BaseService<FlowableForm> {
    /**
     * 分页查询流程表单
     *
     * @param page
     * @param flowableForm
     * @return
     */
    @Override
    IPage<FlowableForm> list(IPage<FlowableForm> page, FlowableForm flowableForm);
}
