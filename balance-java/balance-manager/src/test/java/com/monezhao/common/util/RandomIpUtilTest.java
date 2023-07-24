package com.monezhao.common.util;

import org.junit.Test;

/**
 * @author monezhao@163.com
 * @date 2023/5/10 3:08 PM
 */
public class RandomIpUtilTest {

    @Test
    public void getRandomIp() {
        for (String s : RandomIpUtil.getRandomIp()) {
            System.out.println(s);
        }
    }
}