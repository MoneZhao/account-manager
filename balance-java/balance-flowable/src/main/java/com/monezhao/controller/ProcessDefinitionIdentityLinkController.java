package com.monezhao.controller;

import com.monezhao.bean.flowable.IdentityRequest;
import com.monezhao.common.Result;
import com.monezhao.service.ProcessDefinitionService;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.identitylink.api.IdentityLink;
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
@RequestMapping("/flowable/processDefinitionIdentityLink")
public class ProcessDefinitionIdentityLinkController extends BaseFlowableController {
    @Autowired
    private ProcessDefinitionService processDefinitionService;

    @GetMapping(value = "/list")
    public Result list(@RequestParam String processDefinitionId) {
        ProcessDefinition processDefinition = processDefinitionService.getProcessDefinitionById(processDefinitionId);
        List<IdentityLink> identityLinks =
                repositoryService.getIdentityLinksForProcessDefinition(processDefinition.getId());
        return Result.ok(responseFactory.createIdentityResponseList(identityLinks));
    }


    @PostMapping(value = "/save")
    public Result save(@RequestBody IdentityRequest identityRequest) {
        processDefinitionService.saveProcessDefinitionIdentityLink(identityRequest);
        return Result.ok();
    }


    @DeleteMapping(value = "/delete")
    public Result delete(@RequestParam String processDefinitionId, @RequestParam String identityId,
                         @RequestParam String identityType) {
        processDefinitionService.deleteProcessDefinitionIdentityLink(processDefinitionId, identityId, identityType);
        return Result.ok();
    }
}
