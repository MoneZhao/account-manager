package com.monezhao.service;

import com.monezhao.bean.sys.SysJob;
import com.monezhao.common.base.BaseService;
import org.quartz.SchedulerException;

/**
 * 定时任务Service
 *
 * @author monezhao@163.com
 */
public interface SysJobService extends BaseService<SysJob> {

    /**
     * 新增任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public boolean saveJob(SysJob job) throws SchedulerException;

    /**
     * 更新任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public boolean updateJob(SysJob job) throws SchedulerException;

    /**
     * 暂停任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public void pause(SysJob job) throws SchedulerException;

    /**
     * 恢复任务
     *
     * @param job 调度信息
     * @return 结果
     */
    public void resume(SysJob job) throws SchedulerException;

    /**
     * 删除任务后，所对应的trigger也将被删除
     *
     * @param job 调度信息
     * @return 结果
     */
    public void delete(SysJob job) throws SchedulerException;

    /**
     * 批量删除调度信息
     *
     * @param jobIds 需要删除的任务ID
     * @return 结果
     */
    public void delete(String ids) throws SchedulerException;

    /**
     * 任务调度状态修改
     *
     * @param jobId 调度信息
     * @return 结果
     */
    public void changeStatus(String jobId) throws SchedulerException;

    /**
     * 立即运行任务
     *
     * @param jobId 调度信息
     * @return 结果
     */
    public void run(String jobId) throws SchedulerException;

    /**
     * 校验cron表达式是否有效
     *
     * @param cronExpression 表达式
     * @return 结果
     */
    public boolean checkCronExpressionIsValid(String cronExpression);
}
