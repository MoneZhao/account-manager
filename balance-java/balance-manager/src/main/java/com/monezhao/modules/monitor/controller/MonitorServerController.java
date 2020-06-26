package com.monezhao.modules.monitor.controller;

import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.server.Server;
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
public class MonitorServerController extends BaseController {
    @RequiresPermissions("monitor:server:getServerInfo")
    @GetMapping(value = "/getServerInfo")
    public Result getServerInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return Result.ok(server);
    }
}
