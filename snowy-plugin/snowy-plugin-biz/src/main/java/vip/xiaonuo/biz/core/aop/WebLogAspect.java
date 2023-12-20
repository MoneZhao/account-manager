package vip.xiaonuo.biz.core.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import vip.xiaonuo.auth.core.pojo.SaBaseLoginUser;
import vip.xiaonuo.auth.core.util.StpLoginUserUtil;
import vip.xiaonuo.common.pojo.CommonResult;
import vip.xiaonuo.common.util.CommonIpAddressUtil;
import vip.xiaonuo.common.util.CommonJoinPointUtil;
import vip.xiaonuo.common.util.CommonServletUtil;

import javax.servlet.http.HttpServletRequest;

/**
 * 异常消息写日志文件
 *
 * @author monezhao@163.com
 * @date 2023-07-15 下午 02:47
 */
@Aspect
@Component
public class WebLogAspect {

    private static final Logger logger = LoggerFactory.getLogger("webLog");

    @Pointcut("execution(public vip.xiaonuo.common.pojo.CommonResult vip.xiaonuo.*.modular.*.controller.*Controller.*(..))*")
    public void webLog() {

    }

    @Around("webLog()")
    public Object doAround(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        // 获取request并设置IP地址
        HttpServletRequest request = CommonServletUtil.getRequest();
        String contextPath = request.getContextPath();
        String url = request.getRequestURI();
        if (url.startsWith(contextPath)) {
            url = url.substring(contextPath.length());
        }
        String method = request.getMethod();
        SaBaseLoginUser loginUser;
        try {
            loginUser = StpLoginUserUtil.getLoginUser();
        } catch (NullPointerException e) {
            loginUser = null;
        }
        long startTime = System.currentTimeMillis();
        Object result = null;
        Exception ex = null;
        String operateResult = "";
        String arg = CommonJoinPointUtil.getArgsJsonString(proceedingJoinPoint);
        String userName = loginUser == null ? CommonIpAddressUtil.getIp(request) : loginUser.getAccount() + ":" + loginUser.getName();
        logger.info("==>      请求开始: {} {} {}, param: {}", userName, method, url, arg);
        try {
            // 执行方法
            result = proceedingJoinPoint.proceed();
        } catch (Exception e) {
            ex = e;
        }
        if (result instanceof CommonResult) {
            CommonResult r = (CommonResult) result;
            operateResult = r.getMsg();
        } else if (ex != null) {
            operateResult = ex.getMessage();
        }
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - startTime;
        if (time >= 5000) {
            logger.error("请求url {} 超过5秒", url);
        }

        logger.info("  <==    请求结束: {} {} {}, cost: {}ms, result: {}", userName, method, url, time, operateResult);

        if (ex != null) {
            throw ex;
        }

        return result;
    }

    @Pointcut("execution(public void vip.xiaonuo.*.modular.*.controller.*Controller.*(..))*")
    public void webVoidLog() {

    }

    @Around("webVoidLog()")
    public void doAroundVoid(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        // 获取request并设置IP地址
        HttpServletRequest request = CommonServletUtil.getRequest();
        String contextPath = request.getContextPath();
        String url = request.getRequestURI();
        if (url.startsWith(contextPath)) {
            url = url.substring(contextPath.length());
        }
        String method = request.getMethod();
        SaBaseLoginUser loginUser;
        try {
            loginUser = StpLoginUserUtil.getLoginUser();
        } catch (NullPointerException e) {
            loginUser = null;
        }
        long startTime = System.currentTimeMillis();
        Exception ex = null;
        String operateResult = "";
        String arg = CommonJoinPointUtil.getArgsJsonString(proceedingJoinPoint);
        String userName = loginUser == null ? CommonIpAddressUtil.getIp(request) : loginUser.getAccount() + ":" + loginUser.getName();
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
            logger.error("请求url {} 超过5秒", url);
        }

        logger.info("  <==    请求结束: {} {} {}, cost: {}ms, result: {}", userName, method, url, time, operateResult);

        if (ex != null) {
            throw ex;
        }

    }

}
