package com.monezhao.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author monezhao@163.com
 * @date 2020/6/13 1:25 下午
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "system-config")
public class DefaultSystemConfig {
    private String defaultPassword;
    private String useCaptcha;
    private String expireTime;
    private String loginCount;
}
