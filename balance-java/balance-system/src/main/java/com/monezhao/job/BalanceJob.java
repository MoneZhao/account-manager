package com.monezhao.job;

import com.monezhao.annotation.ShiroSecurityManagerChecker;
import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.RandomIpUtil;
import com.monezhao.service.SysLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

/**
 * 定时任务调度测试
 *
 * @author monezhao@163.com
 */
@Component("balanceJob")
@Slf4j
public class BalanceJob {

    @Autowired
    private SysLogService sysLogService;

    public void hasMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        log.info("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i);
    }

    public void hasParam(String param) {
        log.info("执行有参方法：{}", param);
    }

    public void hasNoParam() {
        log.info("执行无参方法");
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveJob() {
        log.info("执行数据库操作相关方法");
    }

    @ShiroSecurityManagerChecker
    public void process() {
        log.info("需要用到Shiro功能的时候引入");
    }

    /**
     * 每日生成登录信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void everydayLogin() {
        Date now = new Date();
        List<SysLog> logs = new ArrayList<>();
        Set<String> ips = RandomIpUtil.getRandomIp();
        Integer i = 1;
        for (String ipStr : ips) {
            Date loginTime = DateUtil.addMiunte(now, i++);
            SysLog sysLog = new SysLog();
            sysLog.setLogType("1");
            sysLog.setLogContent("用户登录");
            sysLog.setUserId("monezhao");
            sysLog.setUserName("赵一鸣");
            sysLog.setIp(ipStr);
            sysLog.setMethod("com.monezhao.controller.SysLoginController.login()");
            sysLog.setRequestUrl("/balance/sys/login");
            sysLog.setRequestType("POST");
            sysLog.setOperateResult("操作成功");
            sysLog.setSuccess("1");
            sysLog.setCostTime(60L + new Random().nextInt(20));
            sysLog.setCreateBy("monezhao");
            sysLog.setCreateDate(loginTime);
            sysLog.setCreateTime(loginTime);
            logs.add(sysLog);
        }

        ips = RandomIpUtil.getRandomIp();
        for (String ipStr : ips) {
            Date loginTime = DateUtil.addMiunte(now, i++);
            SysLog sysLog = new SysLog();
            sysLog.setLogType("1");
            sysLog.setLogContent("用户登录");
            sysLog.setUserId("admin");
            sysLog.setUserName("admin");
            sysLog.setIp(ipStr);
            sysLog.setMethod("com.monezhao.controller.SysLoginController.login()");
            sysLog.setRequestUrl("/balance/sys/login");
            sysLog.setRequestType("POST");
            sysLog.setOperateResult("操作成功");
            sysLog.setSuccess("1");
            sysLog.setCostTime(60L + new Random().nextInt(20));
            sysLog.setCreateBy("admin");
            sysLog.setCreateDate(loginTime);
            sysLog.setCreateTime(loginTime);
            logs.add(sysLog);
        }

        sysLogService.saveBatch(logs);
    }

}
