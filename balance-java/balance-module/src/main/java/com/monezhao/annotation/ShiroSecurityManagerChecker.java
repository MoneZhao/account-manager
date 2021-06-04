package com.monezhao.annotation;

/**
 * 如果涉及数据库操作, 因为框架中涉及到创建人,创建时间,修改人,修改时间的自动填写, 需要ShiroSecurityManager
 * 所以要么把值填上, 要么引入此注解
 *
 * @author monezhao@163.com
 * @date 2021/6/4 5:22 下午
 */
public @interface ShiroSecurityManagerChecker {
}
