package com.monezhao.config;

import com.monezhao.identity.CustomGroupEntityManager;
import com.monezhao.identity.CustomUserEntityManager;
import org.flowable.idm.engine.IdmEngineConfiguration;
import org.flowable.idm.spring.SpringIdmEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author monezhao@163.com
 * @date 2020/12/8 11:01 上午
 */
@Configuration
public class FlowableIdmConfig implements EngineConfigurationConfigurer<SpringIdmEngineConfiguration> {

    @Override
    public void configure(SpringIdmEngineConfiguration configuration) {
        configuration.setGroupEntityManager(customGroupEntityManager(configuration));
        configuration.setUserEntityManager(customUserEntityManager(configuration));
    }

    @Bean
    public CustomGroupEntityManager customGroupEntityManager(IdmEngineConfiguration configuration) {
        return new CustomGroupEntityManager(configuration, configuration.getGroupDataManager());
    }

    @Bean
    public CustomUserEntityManager customUserEntityManager(IdmEngineConfiguration configuration) {
        return new CustomUserEntityManager(configuration, configuration.getUserDataManager());
    }
}
