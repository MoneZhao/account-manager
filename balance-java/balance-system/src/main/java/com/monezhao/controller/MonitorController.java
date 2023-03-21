package com.monezhao.controller;

import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.bean.utilsVo.RedisInfo;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.util.IpUtils;
import com.monezhao.service.RedisService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author monezhao@163.com
 * @date 2020年3月24日
 */
@Slf4j
@RestController
@RequestMapping("/actuator")
@Api(tags = "服务器监控")
@ApiSupport(author = "monezhao@163.com")
public class MonitorController extends BaseController {

    @Autowired
    private RedisService redisService;

    @GetMapping("/redis/info")
    @ApiOperation("redis信息")
    public Result getRedisInfo() throws Exception {
        List<RedisInfo> infoList = redisService.getInfo();
        return Result.ok(infoList);
    }

    @GetMapping("/redis/keysSize")
    @ApiOperation("redis key容量")
    public Map<String, Object> getKeysSize() throws Exception {
        return redisService.getKeysSize();
    }

    @GetMapping("/redis/memoryInfo")
    @ApiOperation("内存信息")
    public Map<String, Object> getMemoryInfo() throws Exception {
        return redisService.getMemoryInfo();
    }

    @GetMapping("/queryDiskInfo")
    @ApiOperation("磁盘信息")
    public Result queryDiskInfo() {
        try {
            // 当前文件系统类
            FileSystemView fsv = FileSystemView.getFileSystemView();
            // 列出所有windows 磁盘
            File[] fs = File.listRoots();
            log.info("查询磁盘信息:" + fs.length + "个");
            List<Map<String, Object>> data = new ArrayList<>();
            for (int i = 0; i < fs.length; i++) {
                if (fs[i].getTotalSpace() == 0) {
                    continue;
                }
                Map<String, Object> map = new LinkedHashMap<>();
                map.put("name", fsv.getSystemDisplayName(fs[i]));
                map.put("totalSpace", fs[i].getTotalSpace());
                map.put("freeSpace", fs[i].getFreeSpace());
                map.put("used", (fs[i].getTotalSpace() - fs[i].getFreeSpace()) * 100 / fs[i].getTotalSpace() + "%");
                data.add(map);
                log.info(map.toString());
            }
            return Result.ok(data);
        } catch (Exception e) {
            log.error("查询失败：", e);
            return Result.error("查询失败");
        }
    }

    @GetMapping("/getRequestIp")
    @ApiOperation("获取请求IP")
    public Result getRequestIp(HttpServletRequest request) {
        String ipAddr = IpUtils.getIpAddr(request);
        log.info("ipAddr: " + ipAddr);
        return Result.ok(ipAddr);
    }
}
