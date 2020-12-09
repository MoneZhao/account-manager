package com.monezhao.bean.flowable;

import lombok.Data;

import java.util.Date;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class ProcessDefinitionRequest {
    private String processDefinitionId;
    private boolean includeProcessInstances = false;
    private Date date;
}
