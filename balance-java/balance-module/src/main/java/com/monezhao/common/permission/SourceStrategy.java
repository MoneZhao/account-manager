package com.monezhao.common.permission;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:56
 * @Description: 数据规则数据源策略
 */
public enum SourceStrategy {
    /**
     * 数据规则数据源策略 1-用户填写，2-系统提供
     */
    TEXT("1", "用户填写"), SYSTEM("2", "系统提供");
    private final String key;
    private final String desc;

    private SourceStrategy(String key, String desc) {
        this.key = key;
        this.desc = desc;
    }

    public String getKey() {
        return key;
    }

    public String getDesc() {
        return desc;
    }
}
