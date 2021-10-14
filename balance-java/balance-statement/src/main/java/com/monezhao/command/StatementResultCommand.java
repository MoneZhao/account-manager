package com.monezhao.command;

import lombok.Data;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/10/23 11:40 上午
 */
@Data
public class StatementResultCommand {

    //X轴数据
    private List<String> x;

    //Y轴数据
    private List<Series> y;

    //X轴标题
    private String xTitle;

    //Y轴标题
    private String yTitle;

    //图表标题
    private String title;

}

