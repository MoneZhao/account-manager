package com.monezhao.bean.flowable;

import lombok.Data;

import java.util.Map;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class TaskRequest {
    private String taskId;
    private String userId;
    private String message;
    private String activityId;
    private String activityName;
    private Map<String, Object> values;
    private CcToVo[] ccToVos;
    private String[] taskIds;
}
