package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.flowable.FlowableForm;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.FlowableFormMapper;
import com.monezhao.service.FlowableFormService;
import org.springframework.stereotype.Service;

/**
 * 流程Service
 *
 * @author monezhao@163.com
 */
@Service
public class FlowableFormServiceImpl extends BaseServiceImpl<FlowableFormMapper, FlowableForm> implements FlowableFormService {
    @Override
    public IPage<FlowableForm> list(IPage<FlowableForm> page, FlowableForm flowableForm) {
        return page.setRecords(baseMapper.list(page, flowableForm));
    }
}
