package com.monezhao.bean.utilsVo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:41
 * @Description:
 */
@Getter
@Setter
public class CommentResponse {

    private String id;
    private String userId;
    private String userName;
    private String type;
    private String typeDesc;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date time;
    private String taskId;
    private String taskName;
    private String taskDefinitionKey;
    private String taskDefinitionName;
    private String processInstanceId;
    private String message;
    private String fullMessage;
}
