package com.monezhao.config;

import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author monezhao@163.com
 * @date 2020/6/13 1:25 下午
 */
@Configuration
@Getter
public class DefaultPasswordConfig {
    @Value("${reset.default-password}")
    private String defaultPassword;
}
