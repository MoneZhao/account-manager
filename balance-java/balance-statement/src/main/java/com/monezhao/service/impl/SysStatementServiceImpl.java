package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monezhao.bean.sys.SysBalanceDetail;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.command.Series;
import com.monezhao.command.StatementCommand;
import com.monezhao.command.StatementResultCommand;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysBalanceDetailService;
import com.monezhao.service.SysBalanceMainService;
import com.monezhao.service.SysStatementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author monezhao@163.com
 * @date 2020/10/23 2:59 下午
 */
@Service
public class SysStatementServiceImpl implements SysStatementService {

    @Autowired
    private SysBalanceMainService balanceMainService;

    @Autowired
    private SysBalanceDetailService balanceDetailService;

    @Override
    public StatementResultCommand query(StatementCommand command) {
        StatementResultCommand resultCommand = new StatementResultCommand();
        resultCommand.setTitle("账户余额曲线");
        resultCommand.setYTitle("账户余额");
        resultCommand.setXTitle("月份");
        String startStr = DateUtil.dateToStr(command.getStartMonth(), "yyyy");
        String endStr = DateUtil.dateToStr(command.getEndMonth(), "yyyy");
        String format;
        if (Objects.equals(startStr, endStr)) {
            format = "MM月";
        } else {
            format = "yyyy年MM月";
        }
        List<String> dates = DateUtil.findMonth(command.getStartMonth(), command.getEndMonth(), format);
        resultCommand.setX(dates);

        SysUser sysUser = ShiroUtils.getSysUser();
        QueryWrapper<SysBalanceMain> mainQueryWrapper = new QueryWrapper<>();
        mainQueryWrapper.lambda()
                .eq(SysBalanceMain::getUserId, sysUser.getUserId())
                .between(SysBalanceMain::getAccountDate, command.getStartMonth(),
                        DateUtil.addSecond(DateUtil.addMonth(command.getEndMonth(), 1), -1))
                .orderByAsc(SysBalanceMain::getAccountDate)
        ;
        List<SysBalanceMain> balanceMains = balanceMainService.list(mainQueryWrapper);

        Map<String, BigDecimal> record = new HashMap<>(balanceMains.size());
        for (SysBalanceMain balanceMain : balanceMains) {
            String dateStr = DateUtil.dateToStr(balanceMain.getAccountDate(), format);
            BigDecimal account = balanceMain.getAccount();
            record.put(dateStr, account);
        }

        return getStatementResultCommand(resultCommand, dates, record);
    }

    @Override
    public StatementResultCommand queryDetail(StatementCommand command) {
        StatementResultCommand resultCommand = new StatementResultCommand();
        resultCommand.setTitle("账户余额曲线");
        resultCommand.setYTitle("账户余额");
        resultCommand.setXTitle("月份");
        String startStr = DateUtil.dateToStr(command.getStartMonth(), "yyyy");
        String endStr = DateUtil.dateToStr(command.getEndMonth(), "yyyy");
        String format;
        if (Objects.equals(startStr, endStr)) {
            format = "MM月";
        } else {
            format = "yyyy年MM月";
        }
        List<String> dates = DateUtil.findMonth(command.getStartMonth(), command.getEndMonth(), format);
        resultCommand.setX(dates);

        SysUser sysUser = ShiroUtils.getSysUser();
        List<SysBalanceDetail> balanceDetails = balanceDetailService.queryDetail(sysUser.getUserId(), command.getStartMonth(),
                DateUtil.addSecond(DateUtil.addMonth(command.getEndMonth(), 1), -1),
                command.getBalanceType());

        Map<String, BigDecimal> record = new HashMap<>(balanceDetails.size());
        for (SysBalanceDetail balanceDetail : balanceDetails) {
            String dateStr = DateUtil.dateToStr(balanceDetail.getAccountDate(), format);
            BigDecimal account = balanceDetail.getAccount();
            record.put(dateStr, account);
        }

        return getStatementResultCommand(resultCommand, dates, record);
    }

    private StatementResultCommand getStatementResultCommand(StatementResultCommand resultCommand, List<String> dates, Map<String, BigDecimal> record) {
        Series series1 = new Series();
        series1.setName("账户余额");
        series1.setType("bar");
        List<BigDecimal> data1 = new ArrayList<>();
        Series series2 = new Series();
        series2.setName("账户余额增长");
        series2.setType("line");
        series2.setSmooth(Boolean.TRUE);
        List<BigDecimal> data2 = new ArrayList<>();

        for (int i = 0; i < dates.size(); i++) {
            String date = dates.get(i);
            BigDecimal current = record.getOrDefault(date, null);
            data1.add(current);

            if (i == 0) {
                data2.add(null);
            } else {
                BigDecimal before = record.getOrDefault(dates.get(i - 1), null);
                if (current == null || before == null) {
                    data2.add(null);
                } else {
                    data2.add(current.subtract(before));
                }
            }
        }
        series1.setData(data1);
        series2.setData(data2);

        List<Series> ys = new ArrayList<>();
        ys.add(series1);
        ys.add(series2);
        resultCommand.setY(ys);
        return resultCommand;
    }

}
