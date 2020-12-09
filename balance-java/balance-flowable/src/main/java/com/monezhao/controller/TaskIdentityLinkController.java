package com.monezhao.controller;

import com.monezhao.bean.flowable.IdentityRequest;
import com.monezhao.common.Result;
import com.monezhao.service.FlowableTaskService;
import org.flowable.identitylink.api.history.HistoricIdentityLink;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020年10月24日
 */
@RestController
@RequestMapping("/flowable/taskIdentityLink")
public class TaskIdentityLinkController extends BaseFlowableController {
    @Autowired
    protected FlowableTaskService flowableTaskService;

    @GetMapping(value = "/list")
    public Result list(@RequestParam String taskId) {
        HistoricTaskInstance task = flowableTaskService.getHistoricTaskInstanceNotNull(taskId);
        List<HistoricIdentityLink> historicIdentityLinks = historyService.getHistoricIdentityLinksForTask(task.getId());
        return Result.ok(responseFactory.createTaskIdentityResponseList(historicIdentityLinks));
    }


    @PostMapping(value = "/save")
    public Result save(@RequestBody IdentityRequest taskIdentityRequest) {
        flowableTaskService.saveTaskIdentityLink(taskIdentityRequest);
        return Result.ok();
    }


    @DeleteMapping(value = "/delete")
    public Result deleteIdentityLink(@RequestParam String taskId, @RequestParam String identityId,
                                     @RequestParam String identityType) {
        flowableTaskService.deleteTaskIdentityLink(taskId, identityId, identityType);
        return Result.ok();
    }
}
