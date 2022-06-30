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
        String url = request.getRequestURI();
        String method = request.getMethod();
        SysUser sysUser = ShiroUtils.getSysUser();
        long startTime = System.currentTimeMillis();
        Object result = null;
        Exception ex = null;
        String operateResult = "";
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

        if (sysUser == null) {
            logger.info("请求结束: {} {} {}, param: {}, cost: {}ms, result: {}",
                    IpUtils.getIpAddr(request), method, url, CommonUtil.paramsToJson(args), time, operateResult);
        } else {
            logger.info("请求结束: {} {} {}, param: {}, cost: {}ms, result: {}",
                    sysUser.getUserId() + ":" + sysUser.getUserName(), method, url, CommonUtil.paramsToJson(args), time, operateResult);
        }

        if (ex != null) {
            throw ex;
        }

        return result;
    }

}
