package com.monezhao.common.validator.group;

import javax.validation.GroupSequence;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:50
 * @Description: 定义校验顺序，如果AddGroup组失败，则UpdateGroup组不会再校验
 */
@GroupSequence({AddGroup.class, UpdateGroup.class})
public interface Group {

}
