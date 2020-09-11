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
public class DefaultSystemConfig {

    @Value("${system-config.default-password}")
    private String defaultPassword;

    @Value("${system-config.use-captcha}")
    private String useCaptcha;

}
