package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.mapper.SysBalanceMainMapper;
import com.monezhao.service.SysBalanceMainService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    /**
     * 账户余额 记录日期 备注
     * @param list list
     * @return boolean
     */
    @Override
    public boolean doImport(List<SysBalanceMain> list) {
        SysUser sysUser = ShiroUtils.getSysUser();
        List<Date> dates = list.stream().map(SysBalanceMain::getAccountDate).collect(Collectors.toList());
        QueryWrapper<SysBalanceMain> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                        .eq(SysBalanceMain::getUserId, sysUser.getUserId())
                        .in(SysBalanceMain::getAccountDate, dates);

        List<SysBalanceMain> mains = this.list(queryWrapper);
        Map<Date, SysBalanceMain> balanceMainMap = mains.stream()
                .collect(Collectors.toMap(SysBalanceMain::getAccountDate, e -> e));

        for (SysBalanceMain balanceMain : list) {
            balanceMain.setUserId(sysUser.getUserId());
            if (balanceMainMap.containsKey(balanceMain.getAccountDate())) {
                balanceMain.setBalanceMainId(balanceMainMap.get(balanceMain.getAccountDate()).getBalanceMainId());
            }
        }
        return this.saveOrUpdateBatch(list);
    }

    @Override
    public boolean exist(SysBalanceMain sysBalanceMain) {
        QueryWrapper<SysBalanceMain> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(SysBalanceMain::getUserId, sysBalanceMain.getUserId())
                .eq(SysBalanceMain::getAccountDate, sysBalanceMain.getAccountDate());
        if (StringUtils.isNotEmpty(sysBalanceMain.getBalanceMainId())) {
            queryWrapper.lambda()
                    .ne(SysBalanceMain::getBalanceMainId, sysBalanceMain.getBalanceMainId());
        }
        List<SysBalanceMain> list = this.list(queryWrapper);
        return list != null && !list.isEmpty();
    }

    @Override
    public void restore(List<String> idsArr) {
        baseMapper.restore(idsArr);
    }

    @Override
    public List<Date> rangDate() {
        return baseMapper.listAllDate(ShiroUtils.getUserId());
    }
}
