package com.monezhao.common.util;

import com.monezhao.bean.utilsVo.YearMonthDayStartAndEnd;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.Date;
import java.util.Objects;

/**
 * @author Zhao Yiming
 * @date 2019/11/18 上午 10:54
 */
public class DateTimeUtil {
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter FORMATTER2 = DateTimeFormatter.ofPattern("yyyy-MM");
    private static final DateTimeFormatter FORMATTER3 = DateTimeFormatter.ofPattern("yyyy");

    /**
     * @return 当前时间, 格式为yyyy-MM-dd
     */
    public static String yearMonthDayNow() {
        return FORMATTER.format(LocalDate.now());
    }

    /**
     * @return 当前时间, 格式为yyyy-MM
     */
    public static String yearMonthNow() {
        return FORMATTER2.format(LocalDate.now());
    }

    /**
     * @return 当前时间, 格式为yyyy
     */
    public static String yearNow() {
        return FORMATTER3.format(LocalDate.now());
    }

    /**
     * @return 一年前, 格式为yyyy-MM-dd
     */
    public static String yearMonthDayOneYearAgo() {
        return yearMonthDayOneYearAgo(LocalDate.now());
    }

    /**
     * @return 一年前, 格式为yyyy
     */
    public static String yearOneYearAgo() {
        return yearOneYearAgo(LocalDate.now());
    }

    private static String yearOneYearAgo(LocalDate now) {
        return FORMATTER3.format(now.minusYears(1).plusMonths(1));
    }

    public static String yearMonthDayOneYearAgo(LocalDate now) {
        return FORMATTER.format(now.minusYears(1).plusMonths(1));
    }

    public static String yearOneYearAgo(Long timestamp) {
        return FORMATTER3.format(
                LocalDateTime.ofInstant(Instant.ofEpochMilli(timestamp), ZoneId.systemDefault())
                        .toLocalDate().minusYears(1).plusMonths(1));
    }

    public static String yearMonthDayOneYearAgo(Long timestamp) {
        return yearMonthDayOneYearAgo(
                LocalDateTime.ofInstant(
                        Instant.ofEpochMilli(timestamp), ZoneId.systemDefault()
                )
                        .toLocalDate()
        );
    }

    /**
     * @return 一年前, 格式为yyyy-MM
     */
    public static String yearMonthOneYearAgo() {
        return yearMonthOneYearAgo(LocalDate.now());
    }

    public static String yearMonthOneYearAgo(LocalDate now) {
        return FORMATTER2.format(now.minusYears(1).plusMonths(1));
    }

    public static String yearMonthOneYearAgo(Long timestamp) {
        return yearMonthOneYearAgo(
                LocalDateTime.ofInstant(
                        Instant.ofEpochMilli(timestamp), ZoneId.systemDefault()
                )
                        .toLocalDate()
        );
    }

    /**
     * @return yyyy-MM日期转时间戳
     */
    public static Long yearMonthToTimestamp(String date) {
        return dateStringToTimestamp(date, "yyyy-MM");
    }

    /**
     * @return yyyy-MM-dd日期转时间戳
     */
    public static Long yearMonthDayToTimestamp(String date) {
        return dateStringToTimestamp(date, "yyyy-MM-dd");
    }

    public static Long dateStringToTimestamp(String date, String formatter) {
        if (Objects.isNull(date) || Objects.equals(date, "")) {
            throw new RuntimeException("未传入日期");
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatter);
        Long dateL;
        try {
            dateL = simpleDateFormat.parse(date).getTime();
        } catch (ParseException e) {
            throw new RuntimeException("传入日期解析失败: " + date + " " + formatter, e);
        }
        return dateL;
    }

    /**
     * @return 时间戳转yyyy-MM-dd日期
     */
    public static String timestampToString(Long timestamp) {
        return timestampToString(timestamp, "yyyy-MM-dd");
    }

    /**
     * @return 时间戳转yyyy-MM日期
     */
    public static String timestampToYearMonth(Long timestamp) {
        return timestampToString(timestamp, "yyyy-MM");
    }

    public static String timestampToString(Long timestamp, String formatter) {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(formatter);
        return dateTimeFormatter.format(LocalDateTime.ofInstant(
                Instant.ofEpochMilli(timestamp), ZoneId.systemDefault()
        ));
    }

    public static YearMonthDayStartAndEnd timestampToYearMonthDayStartAndEnd(Long timestamp) {
        return timestampToYearMonthDayStartAndEnd(timestamp, "yyyyMMdd");
    }

    public static YearMonthDayStartAndEnd timestampToYearMonthDayStartAndEnd(Long timestamp, String format) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        LocalDateTime localDateTime = LocalDateTime
                .ofInstant(Instant.ofEpochMilli(timestamp), ZoneId.systemDefault());
        String firstDayOfMonth = formatter.format(localDateTime.with(TemporalAdjusters.firstDayOfMonth()));
        String lastDayOfMonth = formatter.format(localDateTime.with(TemporalAdjusters.lastDayOfMonth()));
        return new YearMonthDayStartAndEnd(firstDayOfMonth, lastDayOfMonth);
    }

    public static YearMonthDayStartAndEnd dateToYearMonthDayStartAndEnd(Date date) {
        return timestampToYearMonthDayStartAndEnd(date.getTime());
    }
}
