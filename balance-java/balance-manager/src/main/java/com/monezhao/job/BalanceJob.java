package com.monezhao.job;

import com.monezhao.annotation.SysLogAuto;
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

    @SysLogAuto(value = "执行多参方法", logType = "3")
    public void hasMultipleParams(String s, Boolean b, Long l, Double d, Integer i) {
        log.info("执行多参方法： 字符串类型{}，布尔类型{}，长整型{}，浮点型{}，整形{}", s, b, l, d, i);
    }

    @SysLogAuto(value = "执行有参方法", logType = "3")
    public void hasParam(String param) {
        log.info("执行有参方法：{}", param);
    }

    @SysLogAuto(value = "执行无参方法", logType = "3")
    public void hasNoParam() {
        log.info("执行无参方法");
    }

    @SysLogAuto(value = "执行数据库操作相关方法", logType = "3")
    @Transactional(rollbackFor = Exception.class)
    public void saveJob() {
        log.info("执行数据库操作相关方法");
    }
}
