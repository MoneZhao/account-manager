package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.mapper.SysBalanceDetailMapper;
import com.monezhao.service.SysBalanceDetailService;
import com.monezhao.service.SysBalanceMainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
        return page.setRecords(baseMapper.list(page, sysBalanceDetail));
    }

    @Override
    @Transactional
    public boolean save(SysBalanceDetail sysBalanceDetail) {
        super.save(sysBalanceDetail);
        Double account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? 0 : account);
        sysBalanceMainService.updateById(sysBalanceMain);
        return true;
    }

    @Override
    @Transactional
    public boolean update(SysBalanceDetail sysBalanceDetail) {
        super.updateById(sysBalanceDetail);
        Double account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? 0 : account);
        sysBalanceMainService.updateById(sysBalanceMain);
        return true;
    }

    @Override
    @Transactional
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
    @Transactional
    public boolean doImport(List<SysBalanceMain> list) {
        List<SysBalanceDetail> detailList = new ArrayList<>();
        SysBalanceDetail detail;
        for (SysBalanceMain main : list) {
            detail = new SysBalanceDetail();
            detail.setAccount(main.getAccount());
            detail.setAccountType("0");
            detail.setBalanceMainId(main.getBalanceMainId());
            detailList.add(detail);
        }
        sysBalanceMainService.saveBatch(list);
        super.saveBatch(detailList);
        return true;
    }

}
