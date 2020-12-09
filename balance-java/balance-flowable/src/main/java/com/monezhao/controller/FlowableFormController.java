package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.flowable.FlowableForm;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.FlowableFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.Arrays;

/**
 * 流程Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/flowable/form")
public class FlowableFormController extends BaseController {
    @Autowired
    private FlowableFormService flowableFormService;

    /**
     * 自定义查询列表
     *
     * @param flowableForm
     * @param current
     * @param size
     * @return
     */

    @GetMapping(value = "/list")
    public Result list(FlowableForm flowableForm, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<FlowableForm> pageList = flowableFormService.list(new Page<FlowableForm>(current, size), flowableForm);
        return Result.ok(pageList);
    }

    @GetMapping(value = "/queryById")
    public Result queryById(@RequestParam String id) {
        FlowableForm flowableForm = flowableFormService.getById(id);
        return Result.ok(flowableForm);
    }

    /**
     * @param flowableForm
     * @return
     * @功能：新增
     */
    @PostMapping(value = "/save")
    public Result save(@Valid @RequestBody FlowableForm flowableForm) {
        flowableFormService.save(flowableForm);
        return Result.ok();
    }

    /**
     * @param flowableForm
     * @return
     * @功能：修改
     */

    @PutMapping(value = "/update")
    public Result update(@Valid @RequestBody FlowableForm flowableForm) {
        flowableFormService.updateById(flowableForm);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */

    @DeleteMapping(value = "/delete")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            flowableFormService.removeByIds(Arrays.asList(idsArr));
        } else {
            flowableFormService.removeById(idsArr[0]);
        }
        return Result.ok();
    }
}
