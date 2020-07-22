package com.monezhao.module.sys.service;

import com.monezhao.bean.utilsVo.RedisInfo;

import java.util.List;
import java.util.Map;


/**
 * @author monezhao@163.com
 * @date 2020年3月24日
 */
public interface RedisService {

    /**
     * 获取redis信息
     *
     * @return
     */
    List<RedisInfo> getInfo();

    /**
     * 获取key数量
     *
     * @return
     */
    Map<String, Object> getKeysSize();

    /**
     * 获取内存内容
     *
     * @return
     */
    Map<String, Object> getMemoryInfo();
}
