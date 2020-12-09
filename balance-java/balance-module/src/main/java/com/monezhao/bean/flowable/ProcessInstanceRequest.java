package com.monezhao.bean.flowable;

import lombok.Data;

import java.util.Map;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class ProcessInstanceRequest {
    private String processDefinitionId;
    private String processDefinitionKey;
    private String tenantId;
    private String businessKey;
    private Map<String, Object> values;
    private String processInstanceId;
    private CcToVo[] ccToVos;
}
