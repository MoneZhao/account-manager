package com.monezhao.common.util;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.lionsoul.ip2region.xdb.Searcher;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

/**
 * @author monezhao@163.com
 * @date 2023-07-05 上午 11:29
 */
@Slf4j
@Component
public class Ip2Region {

    private static final String UNKNOWN = "unknown";

    private Searcher searcher = null;

    public Ip2Region() {
        // 从 dbPath 加载整个 xdb 到内存。
        try {
            Resource resource = new ClassPathResource("ip2region.xdb");
            searcher = Searcher.newWithBuffer(IoUtil.readBytes(resource.getInputStream()));
            log.info("---------【IP数据库加载成功】---------");
        } catch (Exception e) {
            log.error("加载IP数据库失败");
        }
    }

    public String getAddr(String ip) {
        if (searcher == null) {
            return UNKNOWN;
        }
        // 查询
        try {
            String region = searcher.search(ip);
            if (region.contains("|0")) {
                region = StrUtil.replace(region, "|0", "");
            }
            if (region.contains("0|")) {
                region = StrUtil.replace(region, "0|", "");
            }
            return region;
        } catch (Exception e) {
            log.error("failed to search: {}\n", ip);
        }
        return UNKNOWN;
    }

    public String getUnknown() {
        return UNKNOWN;
    }

}
