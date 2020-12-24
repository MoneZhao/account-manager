package com.monezhao.config.threadpool;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:15
 * @Description: 线程池配置
 */
@EnableScheduling
@EnableAsync
@Configuration
public class ThreadPoolConfig {

    /**
     * 核心线程池大小
     */
    @Value("${async.executor.thread.core-pool-size}")
    private final int corePoolSize = 10;
    /**
     * 最大可创建的线程数
     */
    @Value("${async.executor.thread.max-pool-size}")
    private final int maxPoolSize = 20;
    /**
     * 队列最大长度
     */
    @Value("${async.executor.thread.queue-capacity}")
    private final int queueCapacity = 2000;
    /**
     * 线程池维护线程所允许的空闲时间
     */
    @Value("${async.executor.thread.keep-alive-seconds}")
    private final int keepAliveSeconds = 60;
    /**
     * 线程名称
     */
    @Value("${async.executor.thread.name-prefix}")
    private final String namePrefix = "async-service-";

    @Bean(name = "applicationTaskExecutor")
    public ThreadPoolTaskExecutor applicationTaskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setMaxPoolSize(maxPoolSize);
        executor.setCorePoolSize(corePoolSize);
        executor.setQueueCapacity(queueCapacity);
        executor.setKeepAliveSeconds(keepAliveSeconds);
        executor.setThreadNamePrefix(namePrefix);
        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
        executor.initialize();
        return executor;
    }
}
