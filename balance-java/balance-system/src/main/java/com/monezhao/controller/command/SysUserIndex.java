package com.monezhao.controller.command;

import lombok.Data;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/6/8 3:11 下午
 */
@Data
public class SysUserIndex {

    //总登录次数
    private Long totalVisitCount;

    //今日登录次数
    private Long todayVisitCount;

    //今日登录IP
    private Long todayIp;

    //近七日总登录记录
    private List<VisitCount> lastSevenVisitCount;

    //近七日用户登录记录
    private List<VisitCount> lastSevenUserVisitCount;

    //近七日登录IP
    private List<String> lastSevenVisitIp;
}
