package com.monezhao.controller;

import com.monezhao.BalanceApplication;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.service.SysBalanceDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author monezhao@163.com
 * @date 2021/10/19 4:28 下午
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {BalanceApplication.class})
@Slf4j
@Ignore
public class SysBalanceDetailControllerTest {

    @Autowired
    private SysBalanceDetailService sysBalanceDetailService;

    @Test
    @Transactional
    public void update() {
        SysBalanceDetail detail = sysBalanceDetailService.getById("ce692882faf11a957c0bb797da6dc6f0");
        SysBalanceDetail detail2 = new SysBalanceDetail();
        BeanUtils.copyProperties(detail, detail2);
        log.info(sysBalanceDetailService.updateById(detail) ? "1" : "0");
        log.info(sysBalanceDetailService.updateById(detail2) ? "1" : "0");
    }
}