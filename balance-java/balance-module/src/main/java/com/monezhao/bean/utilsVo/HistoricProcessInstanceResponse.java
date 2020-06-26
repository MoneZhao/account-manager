package com.monezhao.bean.utilsVo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:42
 * @Description:
 */
@Getter
@Setter
public class HistoricProcessInstanceResponse {
    protected String id;
    protected String name;
    protected String processDefinitionId;
    protected String tenantId;
    private String businessKey;
    private String processDefinitionName;
    private String processDefinitionKey;
    private Integer processDefinitionVersion;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date startTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date endTime;
    private Long durationInMillis;
    private String startUserId;
    private String startActivityId;
    private String superProcessInstanceId;
}
