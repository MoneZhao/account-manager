package com.monezhao.aspect;

import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SysLoginForm;
import com.monezhao.common.Result;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.IpUtils;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysLogService;
import com.monezhao.service.SysUserService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:13
 * @Description: 系统日志拦截处理
 */
@Aspect
@Component
public class SysLogAutoAspect {
    /**
     * 1-用户登录
     */
    private static final String LOG_TYPE_1 = "1";
    /**
     * 2-用户操作
     */
    private static final String LOG_TYPE_2 = "2";

    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private SysUserService sysUserService;

    @Around("@annotation(sysLogAuto)")
    public Object around(ProceedingJoinPoint joinPoint, SysLogAuto sysLogAuto) throws Throwable {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        // 请求的参数
        Object[] args = joinPoint.getArgs();
        SysLog sysLog = new SysLog();
        sysLog.setLogContent(sysLogAuto.value());
        sysLog.setLogType(sysLogAuto.logType());
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        sysLog.setMethod(className + "." + methodName + "()");
        // 获取request并设置IP地址
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        sysLog.setIp(IpUtils.getIpAddr(request));
        sysLog.setRequestUrl(request.getRequestURI());
        sysLog.setRequestType(request.getMethod());
        SysUser sysUser = null;
        // 1-用户登录
        if (LOG_TYPE_1.equals(sysLogAuto.logType())) {
            SysLoginForm aSysLoginForm = (SysLoginForm) args[0];
            sysUser = sysUserService.getById(aSysLoginForm.getUserId());
            if (sysUser == null) {
                sysUser = new SysUser();
                sysUser.setUserId(aSysLoginForm.getUserId());
            }
        } else if (LOG_TYPE_2.equals(sysLogAuto.logType())) {
            sysUser = ShiroUtils.getSysUser();
            sysLog.setRequestParam(CommonUtil.paramsToJson(args));
        }
        if (sysUser != null) {
            sysLog.setUserId(sysUser.getUserId());
            sysLog.setUserName(sysUser.getUserName());
            sysLog.setCreateBy(sysUser.getUserId());
        }

        long beginTime = System.currentTimeMillis();
        Object result = null;
        Exception ex = null;
        try {
            // 执行方法
            result = joinPoint.proceed();
        } catch (Exception e) {
            ex = e;
        }
        // 执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;
        // 保存日志
        sysLog.setCostTime(time);

        sysLog.setSuccess("0");
        String operateResult = "";
        if (result instanceof Result) {
            Result r = (Result) result;
            operateResult = r.getMsg();
            if (Objects.equals(r.getCode(), Result.SC_OK)) {
                sysLog.setSuccess("1");
            }
        } else if (ex != null) {
            operateResult = ex.getMessage();
        }

        sysLog.setOperateResult(operateResult);
        // 保存系统日志
        sysLogService.save(sysLog);

        if (ex != null) {
            throw ex;
        }

        return result;
    }

}
