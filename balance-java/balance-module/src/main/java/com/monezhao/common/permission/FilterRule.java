package com.monezhao.common.permission;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:56
 * @Description: 条件过滤规则
 */
@Getter
@Setter
public class FilterRule implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 查询sql别名
     */
    private String alias;
    /**
     * 查询sql属性名
     */
    private String field;
    /**
     * 查询表达式
     */
    private String operate;
    /**
     * 值
     */
    private String value;

    public FilterRule() {
    }

    public FilterRule(String alias, String field, String operate, String value) {
        this.alias = alias;
        this.field = field;
        this.operate = operate;
        this.value = value;
    }

    public FilterRule(String alias, String field, String value) {
        this(alias, field, FilterOperate.EQ.getValue(), value);
    }

    public FilterRule(String field, String value) {
        this(null, field, value);
    }
}
