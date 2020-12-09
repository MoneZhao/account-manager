package com.monezhao.bean.flowable;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class IdentityRequest {
    private String processDefinitionId;
    private String taskId;
    private String identityId;
    private String identityType;
}
