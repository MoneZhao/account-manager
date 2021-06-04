package com.monezhao.aspect;

import com.monezhao.common.util.SpringContextUtils;
import org.apache.shiro.util.ThreadContext;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * @author monezhao@163.com
 * @date 2021/6/4 5:23 下午
 */
@Aspect
@Component
public class ShiroSecurityManagerCheckerAspect {
    @Pointcut("@annotation(com.monezhao.annotation.ShiroSecurityManagerChecker)")
    public void dataFilterCut() {

    }

    @Before("dataFilterCut()")
    public void dataFilter(JoinPoint point) {
        SecurityManager securityManager = ThreadContext.getSecurityManager();
        if (securityManager == null) {
            securityManager = SpringContextUtils.getBean("securityManager", DefaultWebSecurityManager.class);
            ThreadContext.bind(securityManager);
        }
    }

}
