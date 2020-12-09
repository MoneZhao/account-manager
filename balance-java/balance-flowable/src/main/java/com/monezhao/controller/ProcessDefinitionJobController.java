package com.monezhao.controller;

import com.monezhao.common.Result;
import org.flowable.job.api.Job;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@RestController
@RequestMapping("/flowable/processDefinitionJob")
public class ProcessDefinitionJobController extends BaseFlowableController {

    @GetMapping(value = "/list")
    public List<Job> list(@RequestParam String processDefinitionId) {
        return managementService.createTimerJobQuery().processDefinitionId(processDefinitionId).list();
    }


    @DeleteMapping(value = "/delete")
    @Transactional(rollbackFor = Exception.class)
    public Result deleteJob(@RequestParam String jobId) {
        managementService.deleteTimerJob(jobId);
        return Result.ok();
    }
}
