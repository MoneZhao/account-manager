package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.SysBalanceDetailMapper;
import com.monezhao.service.SysBalanceDetailService;
import com.monezhao.service.SysBalanceMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 账户明细Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysBalanceDetailServiceImpl extends BaseServiceImpl<SysBalanceDetailMapper, SysBalanceDetail>
        implements SysBalanceDetailService {

    @Autowired
    private SysBalanceMainService sysBalanceMainService;

    @Override
    public IPage<SysBalanceDetail> list(IPage<SysBalanceDetail> page, SysBalanceDetail sysBalanceDetail) {
        List<SysBalanceDetail> records = baseMapper.list(page, sysBalanceDetail);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(SysBalanceDetail sysBalanceDetail) {
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceDetail.setUserId(sysBalanceMain.getUserId());
        super.save(sysBalanceDetail);
        Double account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? 0 : account);
        sysBalanceMainService.updateById(sysBalanceMain);
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean update(SysBalanceDetail sysBalanceDetail) {
        super.updateById(sysBalanceDetail);
        Double account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? 0 : account);
        sysBalanceMainService.updateById(sysBalanceMain);
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean delete(String[] idsArr) {
        String id = idsArr[0];
        SysBalanceDetail sysBalanceDetail = baseMapper.selectById(id);
        if (idsArr.length > 1) {
            super.removeByIds(Arrays.asList(idsArr));
        } else {
            super.removeById(idsArr[0]);
        }
        Double account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? 0 : account);
        sysBalanceMainService.updateById(sysBalanceMain);
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMain(List<String> idsArr) {
        QueryWrapper<SysBalanceDetail> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .in(SysBalanceDetail::getBalanceMainId, idsArr);
        List<String> ids = baseMapper.selectList(queryWrapper).stream()
                .map(SysBalanceDetail::getBalanceDetailId)
                .collect(Collectors.toList());
        if (ids.size() > 1) {
            super.removeByIds(ids);
        } else if (ids.size() == 1) {
            super.removeById(ids.get(0));
        }
        if (idsArr.size() > 1) {
            sysBalanceMainService.removeByIds(idsArr);
        } else {
            sysBalanceMainService.removeById(idsArr.get(0));
        }
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean doImport(List<SysBalanceDetail> list) {
        baseMapper.deleteDetailIds(
                list.parallelStream().map(SysBalanceDetail::getBalanceDetailId).collect(Collectors.toList())
        );
        this.saveBatch(list);
        return true;
    }

    @Override
    public List<SysBalanceDetail> list(List<String> mainIds, String userId) {
        return baseMapper.listExport(mainIds, userId);
    }

}
