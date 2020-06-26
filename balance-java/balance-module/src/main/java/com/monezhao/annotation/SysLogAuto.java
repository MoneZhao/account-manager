package com.monezhao.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:13
 * @Description: 系统日志注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLogAuto {
    /**
     * 日志内容
     *
     * @return
     */
    String value() default "";

    /**
     * 日志类型
     *
     * @return 1:登录日志 2:操作日志 3:定时任务
     */
    String logType() default "2";
}
