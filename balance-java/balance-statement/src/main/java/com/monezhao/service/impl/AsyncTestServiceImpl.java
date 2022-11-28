package com.monezhao.service.impl;

import com.monezhao.service.AsyncTestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * @author monezhao@163.com
 * @date 2022-11-28 下午 03:04
 */
@Service
@Slf4j
public class AsyncTestServiceImpl implements AsyncTestService {

    @Override
    @Async
    public void asyncTest() {
        try {
            Thread.sleep(5000);
            log.info("done");
        } catch (InterruptedException ignored) {

        }
    }
}