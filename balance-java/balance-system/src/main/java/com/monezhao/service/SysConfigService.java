package com.monezhao.service;

import com.monezhao.bean.sys.SysConfig;
import com.monezhao.common.base.BaseService;

/**
 * 系统参数Service
 *
 * @author monezhao@163.com
 */
public interface SysConfigService extends BaseService<SysConfig> {

    /**
     * 加载系统参数到redis
     *
     * @param configIds
     */
    void loadSysConfigToRedis(String configIds);

    /**
     * 保存系统参数，并加载进redis缓存
     *
     * @param sysConfig
     */
    void saveSysConfig(SysConfig sysConfig);

    /**
     * 修改系统参数，并加载进redis缓存
     *
     * @param sysConfig
     */
    void updateSysConfig(SysConfig sysConfig);

    /**
     * 删除系统参数，并重新加载redis缓存
     *
     * @param ids
     */
    void deleteSysConfig(String ids);

    /**
     * 获取系统参数
     *
     * @param configId     configId
     * @param defaultValue defaultValue
     * @return SysConfig
     */
    String getSysConfig(String configId, String defaultValue);
}
