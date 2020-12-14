package com.monezhao.common.xss;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.stereotype.Component;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:18
 * @Description: XssFilter
 */
@Slf4j
@Component
@ConditionalOnExpression("'${spring.profiles.active}'.equals('dev')")
public class ControllerCostFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String path = request.getRequestURI();
        String method = request.getMethod();
        long startTime = System.currentTimeMillis();
        filterChain.doFilter(servletRequest, servletResponse);
        long endTime = System.currentTimeMillis();
        long costTime = endTime - startTime;
        log.info("请求url: {}, 方法: {}, 耗时: {}毫秒", path, method, costTime);
        if (costTime > 5000) {
            log.error("请求url: {} 耗时过长, 请检查方法", path);
        }
    }

}
