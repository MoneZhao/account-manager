package com.monezhao.controller;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.awt.*;

/**
 * @author monezhao@163.com
 * @date 2020/6/13 12:21 上午
 */
public class FontTest {
    @Test
    public void test() throws Exception {
        Resource resource = new ClassPathResource("SourceHanSerifCN-Regular.ttf");
        Font font = Font.createFont(Font.TRUETYPE_FONT, resource.getInputStream());
        System.err.println(font.getFontName());
    }
}