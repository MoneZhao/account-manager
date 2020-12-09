package com.monezhao.bean.flowable;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class ProcessDefinitionResponse {
    private String id;
    private String key;
    private int version;
    private String name;
    private String description;
    private String tenantId;
    private String category;
    private String formKey;
    private boolean graphicalNotationDefined = false;
    private boolean suspended = false;
}
