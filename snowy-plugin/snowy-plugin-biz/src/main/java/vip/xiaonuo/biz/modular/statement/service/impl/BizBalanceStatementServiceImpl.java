package vip.xiaonuo.biz.modular.statement.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import vip.xiaonuo.biz.core.util.DateUtil;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailPageParam;
import vip.xiaonuo.biz.modular.balancedetail.service.BizBalanceDetailService;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.service.BizBalanceMainService;
import vip.xiaonuo.biz.modular.statement.param.StatementDetailCommand;
import vip.xiaonuo.biz.modular.statement.param.StatementDetailStatementCommand;
import vip.xiaonuo.biz.modular.statement.param.StatementMainCommand;
import vip.xiaonuo.biz.modular.statement.service.BizBalanceStatementService;
import vip.xiaonuo.biz.modular.statement.vo.Series;
import vip.xiaonuo.biz.modular.statement.vo.StatementResultCommand;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author monezhao@163.com
 * @date 2024/1/12 2:51 PM
 */
@Service
public class BizBalanceStatementServiceImpl implements BizBalanceStatementService {

    @Resource
    private BizBalanceMainService bizBalanceMainService;

    @Resource
    private BizBalanceDetailService bizBalanceDetailService;

    @Override
    public StatementResultCommand query(StatementMainCommand command) {
        StatementResultCommand resultCommand = new StatementResultCommand();
        resultCommand.setTitle("账户余额曲线");
        resultCommand.setYTitle("账户余额");
        resultCommand.setXTitle("日期");
        List<String> dates;
        Map<String, BigDecimal> record;
        if ("0".equals(command.getQueryType())) {
            //按月统计
            String startStr = DateUtil.dateToStr(command.getStartMonth(), "yyyy");
            String endStr = DateUtil.dateToStr(command.getEndMonth(), "yyyy");
            String format;
            if (Objects.equals(startStr, endStr)) {
                format = "MM月";
            } else {
                format = "yyyy年MM月";
            }
            dates = vip.xiaonuo.biz.core.util.DateUtil.findMonth(command.getStartMonth(), command.getEndMonth(), format);
            resultCommand.setX(dates);

            QueryWrapper<BizBalanceMain> mainQueryWrapper = new QueryWrapper<>();
            mainQueryWrapper.lambda()
                    .eq(BizBalanceMain::getUserId, StpUtil.getLoginIdAsString())
                    .between(BizBalanceMain::getAccountDate, command.getStartMonth(),
                            vip.xiaonuo.biz.core.util.DateUtil.addSecond(vip.xiaonuo.biz.core.util.DateUtil.addMonth(command.getEndMonth(), 1), -1))
                    .orderByAsc(BizBalanceMain::getAccountDate)
            ;
            List<BizBalanceMain> balanceMains = bizBalanceMainService.list(mainQueryWrapper);

            record = new HashMap<>(balanceMains.size());
            for (BizBalanceMain balanceMain : balanceMains) {
                String dateStr = DateUtil.dateToStr(balanceMain.getAccountDate(), format);
                BigDecimal account = balanceMain.getAccount();
                record.put(dateStr, account);
            }
        } else {
            //按年统计
            List<Date> rangDate = bizBalanceMainService.rangDate();
            Map<String, List<Date>> dateMap = rangDate.stream()
                    .collect(Collectors.groupingBy(e -> DateUtil.dateToStr(e, "yyyy年")));
            dates = new ArrayList<>(dateMap.size());
            List<String> yearDates = new ArrayList<>(dateMap.size());
            for (Map.Entry<String, List<Date>> entry : dateMap.entrySet()) {
                String a = entry.getKey();
                List<Date> b = entry.getValue();
                dates.add(a);
                yearDates.add(DateUtil.dateToStr(b.get(0)));
            }

            dates = dates.stream().sorted().collect(Collectors.toList());
            resultCommand.setX(dates);

            QueryWrapper<BizBalanceMain> mainQueryWrapper = new QueryWrapper<>();
            mainQueryWrapper.lambda()
                    .eq(BizBalanceMain::getUserId, StpUtil.getLoginIdAsString())
                    .in(BizBalanceMain::getAccountDate, yearDates)
                    .orderByAsc(BizBalanceMain::getAccountDate)
            ;
            List<BizBalanceMain> balanceMains = bizBalanceMainService.list(mainQueryWrapper);

            record = new HashMap<>(balanceMains.size());
            for (BizBalanceMain balanceMain : balanceMains) {
                String dateStr = DateUtil.dateToStr(balanceMain.getAccountDate(), "yyyy年");
                BigDecimal account = balanceMain.getAccount();
                record.put(dateStr, account);
            }
        }

        return getStatementResultCommand(resultCommand, dates, record);
    }

    @Override
    public StatementResultCommand queryDetail(StatementDetailCommand command) {
        StatementResultCommand resultCommand = new StatementResultCommand();
        resultCommand.setTitle("账户余额曲线");
        resultCommand.setYTitle("账户余额");
        resultCommand.setXTitle("日期");
        String startStr = DateUtil.dateToStr(command.getStartMonth(), "yyyy");
        String endStr = DateUtil.dateToStr(command.getEndMonth(), "yyyy");
        String format;
        if (Objects.equals(startStr, endStr)) {
            format = "MM月";
        } else {
            format = "yyyy年MM月";
        }
        List<String> dates = vip.xiaonuo.biz.core.util.DateUtil.findMonth(command.getStartMonth(), command.getEndMonth(), format);
        resultCommand.setX(dates);

        List<BizBalanceDetail> balanceDetails = bizBalanceDetailService.queryDetail(StpUtil.getLoginIdAsString(), command.getStartMonth(),
                vip.xiaonuo.biz.core.util.DateUtil.addSecond(vip.xiaonuo.biz.core.util.DateUtil.addMonth(command.getEndMonth(), 1), -1),
                command.getBalanceType());

        Map<String, BigDecimal> record = new HashMap<>(balanceDetails.size());
        for (BizBalanceDetail balanceDetail : balanceDetails) {
            String dateStr = DateUtil.dateToStr(balanceDetail.getAccountDate(), format);
            BigDecimal account = balanceDetail.getAccount();
            record.put(dateStr, account);
        }

        return getStatementResultCommand(resultCommand, dates, record);
    }

    private StatementResultCommand getStatementResultCommand(StatementResultCommand resultCommand, List<String> dates,
                                                             Map<String, BigDecimal> record) {
        if (dates.isEmpty()) {
            return resultCommand;
        }
        if (record.isEmpty()) {
            return resultCommand;
        }
        Series series1 = new Series();
        series1.setName("账户余额");
        series1.setType("bar");
        List<BigDecimal> data1 = new ArrayList<>();
        Series series2 = new Series();
        series2.setName("账户余额增长");
        series2.setType("line");
        series2.setSmooth(false);
        List<BigDecimal> data2 = new ArrayList<>();

        for (int i = 0; i < dates.size(); i++) {
            String date = dates.get(i);
            BigDecimal current = record.getOrDefault(date, null);
            data1.add(current);

            if (i == 0) {
                data2.add(null);
            } else {
                BigDecimal before = record.getOrDefault(dates.get(i - 1), null);
                if (current == null) {
                    data2.add(null);
                } else if (before == null) {
                    data2.add(current);
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

    @Override
    public List<BizBalanceDetail> listStatement(StatementDetailStatementCommand command) {
        QueryWrapper<BizBalanceMain> mainQueryWrapper = new QueryWrapper<>();
        String statementDate = command.getStatementDate();
        if ("0".equals(command.getQueryType())) {
            Date start = DateUtil.strToDate(statementDate + "-01", DateUtil.DATE_FORMAT_DEFAULT);
            mainQueryWrapper.lambda()
                    .eq(BizBalanceMain::getUserId, StpUtil.getLoginIdAsString())
                    .between(BizBalanceMain::getAccountDate, start,
                            DateUtil.addDay(DateUtil.addMonth(start, 1), -1))
                    .orderByDesc(BizBalanceMain::getAccountDate);
        } else {
            Date end = DateUtil.strToDate(statementDate + "12-31", DateUtil.DATE_FORMAT_DEFAULT);
            mainQueryWrapper.lambda()
                    .eq(BizBalanceMain::getUserId, StpUtil.getLoginIdAsString())
                    .between(BizBalanceMain::getAccountDate,
                            DateUtil.addYear(DateUtil.addDay(end, 1), -1), end)
                    .orderByDesc(BizBalanceMain::getAccountDate);
        }
        BizBalanceMain balanceMain = bizBalanceMainService.getOne(mainQueryWrapper, false);
        if (balanceMain == null) {
            return new ArrayList<>();
        }

        BizBalanceDetailPageParam query = new BizBalanceDetailPageParam();
        query.setBalanceMainId(balanceMain.getId());
        return bizBalanceDetailService.list(query);
    }
}
