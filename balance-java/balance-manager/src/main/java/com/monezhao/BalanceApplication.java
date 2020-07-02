package com.monezhao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author monezhao@163.com
 * @date 2020年3月23日
 */
@SpringBootApplication
public class BalanceApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BalanceApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(BalanceApplication.class);
    }
}
