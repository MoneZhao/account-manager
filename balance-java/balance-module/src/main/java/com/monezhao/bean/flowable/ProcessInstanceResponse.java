package com.monezhao.bean.flowable;

import lombok.Data;

import java.util.Date;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class ProcessInstanceResponse {
    protected String id;
    protected String businessKey;
    protected boolean suspended;
    protected String processDefinitionId;
    protected String processDefinitionName;
    protected String processDefinitionKey;
    protected Integer processDefinitionVersion;
    protected String currentActivityId;
    protected String currentActivityName;
    protected String tenantId;
    protected Date startTime;
    protected String startUserId;
    protected String superProcessInstanceId;
}
