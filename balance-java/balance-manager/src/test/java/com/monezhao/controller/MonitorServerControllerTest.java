package com.monezhao.controller;

import com.monezhao.common.server.Server;
import com.monezhao.common.util.JacksonUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author monezhao@163.com
 * @date 2020/6/13 12:21 上午
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class MonitorServerControllerTest {

    @Test
    public void getServerInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        log.info(JacksonUtil.objToStr(server));
    }
}