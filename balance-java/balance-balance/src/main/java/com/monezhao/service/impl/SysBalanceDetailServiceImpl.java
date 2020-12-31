package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.sys.SysCodeInfo;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.mapper.SysBalanceDetailMapper;
import com.monezhao.service.SysBalanceDetailService;
import com.monezhao.service.SysBalanceMainService;
import com.monezhao.service.SysCodeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;
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

    @Autowired
    private SysCodeInfoService sysCodeInfoService;

    @Override
    public IPage<SysBalanceDetail> list(IPage<SysBalanceDetail> page, SysBalanceDetail sysBalanceDetail) {
        List<SysBalanceDetail> records = baseMapper.list(page, sysBalanceDetail);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    public boolean exist(SysBalanceDetail sysBalanceDetail) {
        QueryWrapper<SysBalanceDetail> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(SysBalanceDetail::getBalanceMainId, sysBalanceDetail.getBalanceDetailId())
                .eq(SysBalanceDetail::getBalanceType, sysBalanceDetail.getBalanceType());
        List<SysBalanceDetail> list = this.list(queryWrapper);
        return list != null && !list.isEmpty();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(SysBalanceDetail sysBalanceDetail) {
        if (exist(sysBalanceDetail)) {
            throw new SysException("已存在此类型数据");
        }

        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceDetail.setUserId(sysBalanceMain.getUserId());
        super.save(sysBalanceDetail);
        BigDecimal account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? BigDecimal.valueOf(0) : account);
        sysBalanceMainService.updateById(sysBalanceMain);
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean update(SysBalanceDetail sysBalanceDetail) {
        if (exist(sysBalanceDetail)) {
            throw new SysException("已存在此类型数据");
        }

        super.updateById(sysBalanceDetail);
        BigDecimal account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? BigDecimal.valueOf(0) : account);
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
        BigDecimal account = baseMapper.account(sysBalanceDetail.getBalanceMainId());
        SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(sysBalanceDetail.getBalanceMainId());
        sysBalanceMain.setAccount(account == null ? BigDecimal.valueOf(0) : account);
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
        String userId = ShiroUtils.getSysUser().getUserId();
        Map<String, List<SysCodeInfo>> stringListMap = sysCodeInfoService.getSysCodeInfosFromDb("balanceType")
                .get("balanceType").stream()
                .collect(Collectors.groupingBy(SysCodeInfo::getContent));
        StringJoiner joiner = new StringJoiner(", ", "[", "]");
        for (SysBalanceDetail sysBalanceDetail : list) {
            String balanceName = sysBalanceDetail.getBalanceName();
            if (!stringListMap.containsKey(balanceName)) {
                joiner.add(balanceName);
            } else {
                sysBalanceDetail.setBalanceType(stringListMap.get(balanceName).get(0).getValue());
            }
        }
        if (joiner.length() > 2) {
            throw new SysException("账户类型不存在: " + joiner.toString());
        }

        Set<Date> dateSet = list.stream().map(SysBalanceDetail::getAccountDate).collect(Collectors.toSet());
        QueryWrapper<SysBalanceMain> mainQueryWrapper = new QueryWrapper<>();
        mainQueryWrapper.lambda()
                .in(SysBalanceMain::getAccountDate, dateSet);
        List<SysBalanceMain> balanceMains = sysBalanceMainService.list(mainQueryWrapper);

        Map<Date, List<SysBalanceMain>> mainListMap = balanceMains.stream()
                .collect(Collectors.groupingBy(SysBalanceMain::getAccountDate));
        Map<Date, List<SysBalanceDetail>> detailListMap = list.stream()
                .collect(Collectors.groupingBy(SysBalanceDetail::getAccountDate));

        for (Map.Entry<Date, List<SysBalanceDetail>> entry : detailListMap.entrySet()) {
            Date k = entry.getKey();
            List<SysBalanceDetail> v = entry.getValue();

            if (mainListMap.containsKey(k) && !mainListMap.get(k).isEmpty()) {
                String mainId = mainListMap.get(k).get(0).getBalanceMainId();
                SysBalanceDetail query = new SysBalanceDetail();
                query.setBalanceMainId(mainId);
                List<SysBalanceDetail> records = this.list(null, query).getRecords();
                Map<String, List<SysBalanceDetail>> recordListMap = records.stream()
                        .collect(Collectors.groupingBy(SysBalanceDetail::getBalanceType));

                List<SysBalanceDetail> adds = new ArrayList<>();
                List<SysBalanceDetail> updates = new ArrayList<>();
                for (SysBalanceDetail detail : v) {
                    if (recordListMap.containsKey(detail.getBalanceType())) {
                        SysBalanceDetail balanceDetail = recordListMap.get(detail.getBalanceType()).get(0);
                        balanceDetail.setAccount(detail.getAccount());
                        balanceDetail.setRemark(detail.getRemark() == null ? "" : detail.getRemark());
                        updates.add(balanceDetail);
                    } else {
                        detail.setBalanceMainId(mainId);
                        detail.setUserId(userId);
                        adds.add(detail);
                    }
                }
                this.saveBatch(adds);
                this.updateBatchById(updates);

                BigDecimal account = baseMapper.account(mainId);
                SysBalanceMain sysBalanceMain = sysBalanceMainService.getById(mainId);
                sysBalanceMain.setAccount(account == null ? BigDecimal.valueOf(0) : account);
                sysBalanceMainService.updateById(sysBalanceMain);
            } else {
                //不存在当前日期数据
                BigDecimal account = v.stream()
                        .map(SysBalanceDetail::getAccount)
                        .reduce(new BigDecimal(0), BigDecimal::add);
                SysBalanceMain main = new SysBalanceMain();
                main.setAccountDate(k);
                main.setUserId(userId);
                main.setAccount(account);
                sysBalanceMainService.save(main);

                for (SysBalanceDetail detail : v) {
                    detail.setBalanceMainId(main.getBalanceMainId());
                    detail.setUserId(userId);
                }
                this.saveBatch(v);
            }
        }

        return true;
    }

    @Override
    public List<SysBalanceDetail> list(List<String> mainIds, String userId) {
        return baseMapper.listExport(mainIds, userId);
    }

}
