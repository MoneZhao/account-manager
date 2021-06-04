package com.monezhao.job;

import com.monezhao.annotation.ShiroSecurityManagerChecker;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 定时任务调度测试
 *
 * @author monezhao@163.com
 */
@Component("balanceJob")
@Slf4j
public class BalanceJob {

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
}
