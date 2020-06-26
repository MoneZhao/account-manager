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
    private static AsyncManager me = new AsyncManager();
    /**
     * 异步操作任务调度线程池
     */
    private ThreadPoolTaskExecutor asyncServiceExecutor = SpringContextUtils.getBean("asyncServiceExecutor");

    /**
     * 单例模式
     */
    private AsyncManager() {
    }

    public static AsyncManager me() {
        return me;
    }

    public void execute(Runnable task) {
        asyncServiceExecutor.execute(task);
    }

    public Future<?> submit(Runnable task) {
        return asyncServiceExecutor.submit(task);
    }

    public <T> Future<T> submit(Callable<T> task) {
        return asyncServiceExecutor.submit(task);
    }

    public ListenableFuture<?> submitListenable(Runnable task) {
        return asyncServiceExecutor.submitListenable(task);
    }

    public <T> ListenableFuture<T> submitListenable(Callable<T> task) {
        return asyncServiceExecutor.submitListenable(task);
    }
}
