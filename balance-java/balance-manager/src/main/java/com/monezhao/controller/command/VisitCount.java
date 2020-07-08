package com.monezhao.controller.command;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @date 2020/6/8 3:16 下午
 */
@Data
public class VisitCount {

    /**
     * MM-dd格式
     */
    private String days;

    private Long count;

}
