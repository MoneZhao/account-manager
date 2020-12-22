package com.monezhao.command;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/10/23 3:41 下午
 */
@Data
public class Series {
    //数据名称
    private String name;
    //类型
    private String type;
    //数据列表
    private List<BigDecimal> data;
}
