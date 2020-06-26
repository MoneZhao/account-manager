package com.monezhao.modules.job;

import com.monezhao.bean.sys.SysJob;
import com.monezhao.common.util.SpringContextUtils;
import org.quartz.JobExecutionContext;

/**
 * 定时任务处理（允许并发执行）
 *
 * @author monezhao@163.com
 */
public class QuartzJobExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception {
        JobInvokeUtil jobInvokeUtil = SpringContextUtils.getBean(JobInvokeUtil.class);
        jobInvokeUtil.invokeMethod(sysJob);
    }
}
