package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.SysBalanceMainMapper;
import com.monezhao.service.SysBalanceMainService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 账户余额主Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysBalanceMainServiceImpl extends BaseServiceImpl<SysBalanceMainMapper, SysBalanceMain>
        implements SysBalanceMainService {
    @Override
    public IPage<SysBalanceMain> list(IPage<SysBalanceMain> page, SysBalanceMain sysBalanceMain) {
        List<SysBalanceMain> records = baseMapper.list(page, sysBalanceMain);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    @Override
    @Transactional
    public boolean delete(List<String> ids) {
        baseMapper.deleteDetail(ids);
        baseMapper.deleteMain(ids);
        return true;
    }
}
