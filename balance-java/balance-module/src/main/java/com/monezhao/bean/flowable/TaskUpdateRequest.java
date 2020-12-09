package com.monezhao.bean.flowable;

import lombok.Data;

import java.util.Date;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@Data
public class TaskUpdateRequest {
    private String id;
    private String name;
    private String assignee;
    private String owner;
    private Date dueDate;
    private String category;
    private String description;
    private int priority;
}
