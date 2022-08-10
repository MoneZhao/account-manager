package com.monezhao.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.bean.sys.SysBalanceCount;
import com.monezhao.mapper.SysBalanceCountMapper;
import com.monezhao.service.SysBalanceCountService;

import java.util.List;

/**
 * 计入总资产Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysBalanceCountServiceImpl extends BaseServiceImpl<SysBalanceCountMapper, SysBalanceCount>
        implements SysBalanceCountService {
    @Override
    public IPage<SysBalanceCount> list(IPage<SysBalanceCount> page, SysBalanceCount sysBalanceCount) {
        List<SysBalanceCount> records = baseMapper.list(page, sysBalanceCount);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }
}
