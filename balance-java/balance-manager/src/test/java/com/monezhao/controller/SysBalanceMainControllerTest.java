package com.monezhao.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.utilsVo.YearMonthDayStartAndEnd;
import com.monezhao.common.util.DateTimeUtil;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.JacksonUtil;
import com.monezhao.service.SysBalanceMainService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author monezhao@163.com
 * @date 2020/6/16 8:49 上午
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class SysBalanceMainControllerTest {

    @Autowired
    private SysBalanceMainService sysBalanceMainService;

    @Test
    public void compare() {
        QueryWrapper<SysBalanceMain> queryWrapper = new QueryWrapper<>();
        String userId = "admin";
        YearMonthDayStartAndEnd startAndEnd =
                DateTimeUtil.dateToYearMonthDayStartAndEnd(DateUtil.strToDate("2020-05-12", "yyyy-MM-dd"));
        queryWrapper.lambda()
                .eq(SysBalanceMain::getUserId, userId)
                .between(SysBalanceMain::getAccountDate, startAndEnd.getFirstDayOfMonth(), startAndEnd.getLastDayOfMonth());
        sysBalanceMainService.list(queryWrapper).forEach(vo -> log.info(JacksonUtil.objToStr(vo)));
    }
}