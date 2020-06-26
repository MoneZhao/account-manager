package com.monezhao.modules.job;

import com.monezhao.bean.sys.SysJob;
import com.monezhao.common.util.SpringContextUtils;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;

/**
 * 定时任务处理（禁止并发执行）
 *
 * @author monezhao@163.com
 */
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
    @Override
    protected void doExecute(JobExecutionContext context, SysJob sysJob) throws Exception {
        JobInvokeUtil jobInvokeUtil = SpringContextUtils.getBean(JobInvokeUtil.class);
        jobInvokeUtil.invokeMethod(sysJob);
    }
}
