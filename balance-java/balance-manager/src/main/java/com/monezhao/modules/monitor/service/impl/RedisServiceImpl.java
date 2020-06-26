package com.monezhao.modules.monitor.service.impl;

import com.monezhao.bean.utilsVo.RedisInfo;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.modules.monitor.service.RedisService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * @author monezhao@163.com
 * @date 2020年3月24日
 */
@Service
@Slf4j
public class RedisServiceImpl implements RedisService {

    @Resource
    private RedisConnectionFactory redisConnectionFactory;

    @Override
    public List<RedisInfo> getInfo() {
        Properties info = redisConnectionFactory.getConnection().info();
        List<RedisInfo> infoList = new ArrayList<>();
        RedisInfo redisInfo = null;
        for (Map.Entry<Object, Object> entry : info.entrySet()) {
            redisInfo = new RedisInfo();
            if (CommonUtil.isNotEmptyObject(entry.getKey())) {
                redisInfo.setKey((String) entry.getKey());
                redisInfo.setValue((String) entry.getValue());
                infoList.add(redisInfo);
            }
        }
        return infoList;
    }

    @Override
    public Map<String, Object> getKeysSize() {
        Long dbSize = redisConnectionFactory.getConnection().dbSize();
        Map<String, Object> map = new HashMap<>(2);
        map.put("time", System.currentTimeMillis());
        map.put("dbSize", dbSize);

        log.info("--getKeysSize--: " + map.toString());
        return map;
    }

    @Override
    public Map<String, Object> getMemoryInfo() {
        Map<String, Object> map = null;
        Properties info = redisConnectionFactory.getConnection().info();
        for (Map.Entry<Object, Object> entry : info.entrySet()) {
            String key = (String) entry.getKey();
            if ("used_memory".equals(key)) {
                map = new HashMap<>(2);
                map.put("used_memory", entry.getValue());
                map.put("time", System.currentTimeMillis());
            }
        }
        log.info("--getMemoryInfo--: " + map.toString());
        return map;
    }
}
