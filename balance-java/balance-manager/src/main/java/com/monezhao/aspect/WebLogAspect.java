package com.monezhao.aspect;

import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.Result;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.IpUtils;
import com.monezhao.common.util.ShiroUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 异常消息写日志文件
 *
 * @author monezhao@163.com
 * @date 2021/1/28 5:48 下午
 */
@Aspect
@Component
public class WebLogAspect {

    private static final Logger logger = LoggerFactory.getLogger("webLog");

    /**
     * 定义切入点，以controller下所有包的请求为切入点
     */
    @Pointcut("execution(public com.monezhao.common.Result com.monezhao.controller.*Controller.*(..))*")
    public void webLog() {

    }

    /**
     * 环绕通知
     *
     * @param proceedingJoinPoint proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around("webLog()")
    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        Object[] args = proceedingJoinPoint.getArgs();
        // 获取request并设置IP地址
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        String contextPath = request.getContextPath();
        String url = request.getRequestURI();
        if (url.startsWith(contextPath)) {
            url = url.substring(contextPath.length());
        }
        String method = request.getMethod();
        SysUser sysUser = ShiroUtils.getSysUser();
        long startTime = System.currentTimeMillis();
        Object result = null;
        Exception ex = null;
        String operateResult = "";
        String arg = CommonUtil.paramsToJson(args);
        String userName = sysUser == null ? IpUtils.getIpAddr(request) : sysUser.getUserId() + ":" + sysUser.getUserName();
        logger.info("==>      请求开始: {} {} {}, param: {}", userName, method, url, arg);
        try {
            // 执行方法
            result = proceedingJoinPoint.proceed();
        } catch (Exception e) {
            ex = e;
        }
        if (result instanceof Result) {
            Result r = (Result) result;
            operateResult = r.getMsg();
        } else if (ex != null) {
            operateResult = ex.getMessage();
        }
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - startTime;
        if (time >= 5000) {
            logger.warn("请求url {} 超过5秒", url);
        }

        logger.info("  <==    请求结束: {} {} {}, cost: {}ms, result: {}", userName, method, url, time, operateResult);

        if (ex != null) {
            throw ex;
        }

        return result;
    }

    /**
     * 定义切入点，以controller下所有包的请求为切入点
     */
    @Pointcut("execution(public void com.monezhao.controller.*Controller.*(..))*")
    public void webVoidLog() {

    }

    /**
     * 环绕通知
     *
     * @param proceedingJoinPoint proceedingJoinPoint
     * @throws Throwable
     */
    @Around("webVoidLog()")
    public void doAroundVoid(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        Object[] args = proceedingJoinPoint.getArgs();
        // 获取request并设置IP地址
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        String contextPath = request.getContextPath();
        String url = request.getRequestURI();
        if (url.startsWith(contextPath)) {
            url = url.substring(contextPath.length());
        }
        String method = request.getMethod();
        SysUser sysUser = ShiroUtils.getSysUser();
        long startTime = System.currentTimeMillis();
        Exception ex = null;
        String operateResult = "";
        String arg = CommonUtil.paramsToJson(args);
        String userName = sysUser == null ? IpUtils.getIpAddr(request) : sysUser.getUserId() + ":" + sysUser.getUserName();
        logger.info("==>      请求开始: {} {} {}, param: {}", userName, method, url, arg);
        try {
            // 执行方法
            proceedingJoinPoint.proceed();
        } catch (Exception e) {
            ex = e;
        }

        if (ex != null) {
            operateResult = ex.getMessage();
        } else {
            operateResult = "操作成功";
        }
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - startTime;
        if (time >= 5000) {
            logger.warn("请求url {} 超过5秒", url);
        }

        logger.info("  <==    请求结束: {} {} {}, cost: {}ms, result: {}", userName, method, url, time, operateResult);

        if (ex != null) {
            throw ex;
        }

    }

}
