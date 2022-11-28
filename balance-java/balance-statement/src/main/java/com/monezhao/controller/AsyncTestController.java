package com.monezhao.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.common.Result;
import com.monezhao.service.AsyncTestService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author monezhao@163.com
 * @date 2022-11-28 下午 03:01
 */
@Slf4j
@RestController
@RequestMapping("/noauth")
@Api(tags = "Async测试")
@ApiSupport(author = "monezhao@163.com")
public class AsyncTestController {

    @Autowired
    private AsyncTestService asyncTestService;

    @GetMapping(value = "/asyncTest")
    @ApiOperation("Async测试")
    public Result asyncTest() {
        asyncTestService.asyncTest();
        log.info("方法还在循环，但我已经可以执行了");
        return Result.ok();
    }

}
