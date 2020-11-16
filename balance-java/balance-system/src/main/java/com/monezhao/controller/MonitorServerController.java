package com.monezhao.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.server.Server;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 服务器监控
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/monitor/server")
@Api(tags = "服务器监控")
@ApiSupport(author = "monezhao@163.com")
public class MonitorServerController extends BaseController {
    @RequiresPermissions("monitor:server:getServerInfo")
    @GetMapping(value = "/getServerInfo")
    @ApiOperation("服务器信息")
    public Result getServerInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return Result.ok(server);
    }
}
