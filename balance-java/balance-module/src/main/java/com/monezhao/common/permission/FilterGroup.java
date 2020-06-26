package com.monezhao.common.permission;

import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CommonUtil;
import lombok.Getter;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:56
 * @Description: 条件过滤组
 */
@Getter
public class FilterGroup implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 组内筛选条件
     */
    private List<FilterRule> rules;

    /**
     * 连接符，支持and、or
     */
    private String operate;

    /**
     * 连接的组
     */
    private List<FilterGroup> groups;

    public FilterGroup() {
    }

    public FilterGroup(FilterRule rule) {
        this.rules = new ArrayList<>();
        this.rules.add(rule);
    }

    public FilterGroup(List<FilterRule> rules) {
        this.rules = rules;
    }

    public FilterGroup(List<FilterRule> rules, String operate, List<FilterGroup> groups) {
        this.rules = rules;
        this.operate = operate;
        this.groups = groups;
    }

    public void andRules(List<FilterRule> rules) {
        if (this.rules == null) {
            this.rules = new ArrayList<>();
        }
        this.rules.addAll(rules);
    }

    public void andRule(FilterRule rule) {
        if (this.rules == null) {
            this.rules = new ArrayList<>();
        }
        this.rules.add(rule);
    }

    public void andGroups(List<FilterGroup> groups) {
        this.operate = FilterOperate.AND.getValue();
        this.groups = groups;
    }

    public void andGroup(FilterGroup group) {
        if (FilterOperate.OR.getValue().equals(this.operate)) {
            throw new SysException("已使用or不能在使用and");
        }
        this.operate = FilterOperate.AND.getValue();
        if (this.groups == null) {
            this.groups = new ArrayList<>();
        }
        this.groups.add(group);
    }

    public void orGroups(List<FilterGroup> groups) {
        this.operate = FilterOperate.OR.getValue();
        this.groups = groups;
    }

    public void orGroup(FilterGroup group) {
        if (FilterOperate.AND.getValue().equals(this.operate)) {
            throw new SysException("已使用and不能在使用or");
        }
        this.operate = FilterOperate.OR.getValue();
        if (this.groups == null) {
            this.groups = new ArrayList<>();
        }
        this.groups.add(group);
    }

    /**
     * 解析为SQL语句
     *
     * @return sql
     */
    public String formatSql() {
        String where = formatRules(this.rules);
        boolean isStart = true;
        FilterOperate groupOperate = FilterOperate.resolveOrDefault(this.operate, FilterOperate.AND);
        if (groupOperate == null) {
            groupOperate = FilterOperate.AND;
        }
        StringBuilder groupBuilder = new StringBuilder();
        if (CollectionUtils.isNotEmpty(this.groups)) {
            for (FilterGroup innerGroup : this.groups) {
                if (innerGroup == null) {
                    continue;
                }
                String innerWhere = innerGroup.formatSql();
                if (CommonUtil.isNotEmptyAfterTrim(innerWhere)) {
                    if (!isStart) {
                        groupBuilder.append(" ").append(groupOperate.getDbValue()).append(" ");
                    }
                    groupBuilder.append(innerWhere);
                    isStart = false;
                }
            }
        }
        String groupWhere = groupBuilder.toString();

        int rulesSize = this.rules == null ? 0 : this.rules.size();
        int groupsSize = this.groups == null ? 0 : this.groups.size();
        // 大于一个表达式用括号包起来
        boolean isNeedBrackets = rulesSize + groupsSize > 1;

        String result = "";
        if (CommonUtil.isEmptyAfterTrim(groupWhere)) {
            result = where;
        } else if (CommonUtil.isEmptyAfterTrim(where)) {
            result = groupWhere;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append(where).append(" ").append(groupOperate.getDbValue()).append(" ").append(groupWhere);
            result = sb.toString();
        }
        return isNeedBrackets ? "(" + result + ")" : result;
    }

    private String formatRules(List<FilterRule> rules) {
        if (CollectionUtils.isEmpty(rules)) {
            return "";
        }

        StringBuilder sb = new StringBuilder();

        boolean isStart = true;
        for (FilterRule rule : rules) {
            if (rule == null) {
                continue;
            }

            String field = StringUtils.strip(rule.getField());
            String value = rule.getValue();
            if (CommonUtil.isEmptyAfterTrim(field) || CommonUtil.isEmptyStr(value)) {
                continue;
            }

            String alias = "";
            if (CommonUtil.isNotEmptyAfterTrim(rule.getAlias())) {
                alias = rule.getAlias() + ".";
            }

            if (!isStart) {
                sb.append(" and ");
            }

            FilterOperate ruleOperate = FilterOperate.resolve(rule.getOperate());
            if (ruleOperate == null) {
                ruleOperate = FilterOperate.EQ;
            }

            if (ruleOperate == FilterOperate.IN) {
                value = "(" + value + ")";
                sb.append(alias).append(field).append(" ").append(ruleOperate.getDbValue()).append(" ").append(value);
            } else if (ruleOperate == FilterOperate.BETWEEN) {
                String[] valueArr = value.split(",");
                if (valueArr.length != 2) {
                    throw new SysException("数据权限between参数设置错误");
                }
                sb.append(alias).append(field).append(" ").append("between").append(" ").append(valueArr[0]).append(" and ").append(valueArr[1]);
            } else {
                sb.append(alias).append(field).append(" ").append(ruleOperate.getDbValue()).append(" ").append(value);
            }
            isStart = false;
        }
        return sb.toString();
    }
}
