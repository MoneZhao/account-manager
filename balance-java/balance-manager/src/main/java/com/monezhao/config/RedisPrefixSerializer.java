package com.monezhao.config;


import com.monezhao.common.util.CommonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.stereotype.Component;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/**
 * @author monezhao@163.com
 * @date 2022/5/11 2:18 PM
 */
@Component
@Slf4j
public class RedisPrefixSerializer implements RedisSerializer<String> {

    @Value("${server.servlet.context-path}")
    private String contextPath;

    @Value("${spring.profiles.active}")
    private String active;

    private final Charset charset = StandardCharsets.UTF_8;

    private static final String SEPARATE = ":";

    @Override
    public byte[] serialize(String s) throws SerializationException {
        String key = contextPath.replaceAll("/", "") + SEPARATE + active + SEPARATE + s;
        return CommonUtil.isEmptyStr(s) ? null : key.getBytes(charset);
    }

    @Override
    public String deserialize(byte[] bytes) throws SerializationException {
        if (bytes == null || bytes.length == 0) {
            return null;
        }
        String saveKey = new String(bytes, charset);
        int index = saveKey.indexOf(contextPath.replaceAll("/", "") + SEPARATE + active + SEPARATE);
        if (index == -1) {
            log.info("key缺少前缀");
        } else {
            saveKey = saveKey.substring(index);
        }

        return saveKey;
    }
}

