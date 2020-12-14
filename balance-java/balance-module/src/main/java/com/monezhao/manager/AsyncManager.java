package com.monezhao.manager;

import com.monezhao.common.util.SpringContextUtils;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.util.concurrent.ListenableFuture;

import java.util.concurrent.Callable;
import java.util.concurrent.Future;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:36
 * @Description: 异步任务管理器
 */
public class AsyncManager {
    private static final AsyncManager ASYNC_MANAGER = new AsyncManager();
    /**
     * 异步操作任务调度线程池
     */
    private final ThreadPoolTaskExecutor applicationTaskExecutor = SpringContextUtils.getBean("applicationTaskExecutor");

    /**
     * 单例模式
     */
    private AsyncManager() {
    }

    public static AsyncManager me() {
        return ASYNC_MANAGER;
    }

    public void execute(Runnable task) {
        applicationTaskExecutor.execute(task);
    }

    public Future<?> submit(Runnable task) {
        return applicationTaskExecutor.submit(task);
    }

    public <T> Future<T> submit(Callable<T> task) {
        return applicationTaskExecutor.submit(task);
    }

    public ListenableFuture<?> submitListenable(Runnable task) {
        return applicationTaskExecutor.submitListenable(task);
    }

    public <T> ListenableFuture<T> submitListenable(Callable<T> task) {
        return applicationTaskExecutor.submitListenable(task);
    }
}
