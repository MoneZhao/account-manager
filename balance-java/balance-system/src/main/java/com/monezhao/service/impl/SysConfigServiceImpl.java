package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysConfig;
import com.monezhao.common.Constants;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.mapper.SysConfigMapper;
import com.monezhao.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;

/**
 * 系统参数Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysConfigServiceImpl extends BaseServiceImpl<SysConfigMapper, SysConfig> implements SysConfigService {

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public IPage<SysConfig> list(IPage<SysConfig> page, SysConfig sysConfig) {
        return page.setRecords(baseMapper.list(page, sysConfig));
    }

    @Override
    public void loadSysConfigToRedis(String configIds) {
        String[] configIdsArr = null;
        if (CommonUtil.isNotEmptyAfterTrim(configIds)) {
            configIdsArr = configIds.split(",");
            for (String configId : configIdsArr) {
                // 先清除
                redisUtil.del(Constants.PREFIX_SYS_CONFIG + configId);
            }
        } else {
            // 先清除
            redisUtil.delPattern(Constants.PREFIX_SYS_CONFIG + "*");
        }
        QueryWrapper<SysConfig> queryWrapper = new QueryWrapper<>();
        if (configIdsArr != null && configIdsArr.length > 0) {
            queryWrapper.in("config_id", (Object[]) configIdsArr);
        }
        queryWrapper.orderByAsc("SORT_NO");
        List<SysConfig> list = this.list(queryWrapper);
        for (SysConfig sysConfig : list) {
            redisUtil.set(Constants.PREFIX_SYS_CONFIG + sysConfig.getConfigId(), sysConfig.getConfigValue());
        }
    }

    /**
     * 保存系统参数，并加载进redis缓存
     *
     * @param sysConfig
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveSysConfig(SysConfig sysConfig) {
        this.save(sysConfig);
        this.loadSysConfigToRedis(sysConfig.getConfigId());
    }

    /**
     * 修改系统参数，并加载进redis缓存
     *
     * @param sysConfig
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateSysConfig(SysConfig sysConfig) {
        this.updateById(sysConfig);
        this.loadSysConfigToRedis(sysConfig.getConfigId());
    }

    /**
     * 删除系统参数，并重新加载redis缓存
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSysConfig(String ids) {
        if (ids == null || ids.trim().length() == 0) {
            throw new SysException("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            this.removeByIds(Arrays.asList(idsArr));
        } else {
            this.removeById(idsArr[0]);
        }
        this.loadSysConfigToRedis(null);
    }

    @Override
    public String getSysConfig(String configId, String defaultValue) {
        if (StringUtils.isEmpty(configId)) {
            return defaultValue;
        }
        String sysConfig = (String) redisUtil.get(Constants.PREFIX_SYS_CONFIG + configId);
        if (sysConfig == null) {
            SysConfig config = this.getById(configId);
            if (config != null) {
                sysConfig = config.getConfigValue();
                redisUtil.set(Constants.PREFIX_SYS_CONFIG + config.getConfigId(), config.getConfigValue());
            } else {
                return defaultValue;
            }
        }
        return sysConfig;
    }
}
