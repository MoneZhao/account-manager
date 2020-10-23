package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.command.Series;
import com.monezhao.command.StatementCommand;
import com.monezhao.command.StatementResultCommand;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.service.SysBalanceMainService;
import com.monezhao.service.SysStatementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
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

    private static DecimalFormat decimalFormat = new DecimalFormat("#.00");

    @Autowired
    private SysBalanceMainService balanceMainService;

    @Override
    public StatementResultCommand query(StatementCommand command) {
        StatementResultCommand resultCommand = new StatementResultCommand();
        resultCommand.setTitle("账户余额曲线");
        resultCommand.setYtitle("账户余额");
        resultCommand.setXtitle("月份");
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
                .eq(SysBalanceMain::getDeleteType, 0)
                .between(SysBalanceMain::getAccountDate, command.getStartMonth(), command.getEndMonth())
                .orderByAsc(SysBalanceMain::getAccountDate)
        ;
        List<SysBalanceMain> balanceMains = balanceMainService.list(mainQueryWrapper);

        Map<String, Double> record = new HashMap<>();
        for (SysBalanceMain balanceMain : balanceMains) {
            String dateStr = DateUtil.dateToStr(balanceMain.getAccountDate(), format);
            Double account = balanceMain.getAccount();
            record.put(dateStr, account);
        }

        Series series1 = new Series();
        series1.setName("账户余额");
        series1.setType("bar");
        List<Double> data1 = new ArrayList<>();
        Series series2 = new Series();
        series2.setName("账户余额增长");
        series2.setType("line");
        List<Double> data2 = new ArrayList<>();

        for (int i = 0; i < dates.size(); i++) {
            String date = dates.get(i);
            Double current = record.getOrDefault(date, null);
            if (current != null) {
                data1.add(doubleScale(current));
            } else {
                data1.add(null);
            }

            if (i == 0 || i == dates.size() - 1) {
                data2.add(null);
            } else {
                Double before = record.getOrDefault(dates.get(i - 1), null);
                if (current == null || before == null) {
                    data2.add(null);
                } else {
                    data2.add(doubleScale(current - before));
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

    private Double doubleScale(Double d) {
        return new BigDecimal(d).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }
}
