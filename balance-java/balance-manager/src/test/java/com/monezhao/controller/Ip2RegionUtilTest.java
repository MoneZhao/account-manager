package com.monezhao.controller;

import com.monezhao.common.util.Ip2Region;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

/**
 * @author monezhao@163.com
 * @date 2023-07-05 上午 11:47
 */
@Slf4j
public class Ip2RegionUtilTest {

    @Test
    public void getAddr() {
        Ip2Region ip2Region = new Ip2Region();
        log.info(ip2Region.getAddr("114.114.114.114"));
    }


}
