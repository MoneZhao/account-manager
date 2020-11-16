package com.monezhao.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.command.StatementCommand;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.service.SysStatementService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * @author monezhao@163.com
 * @date 2020/10/23 2:46 下午
 */
@RestController
@RequestMapping("/sys/statement")
@Api(tags = "账户报表")
@ApiSupport(author = "monezhao@163.com")
public class SysStatementController extends BaseController {

    @Autowired
    private SysStatementService statementService;

    /**
     * @param command StatementCommand
     * @return Result Result
     * @功能：查询账户报表
     */
    @RequiresPermissions("sys:statement:query")
    @PostMapping(value = "/query")
    @ApiOperation("查询账户报表")
    public Result query(@Valid @RequestBody StatementCommand command) {
        return Result.ok(statementService.query(command));
    }
}
