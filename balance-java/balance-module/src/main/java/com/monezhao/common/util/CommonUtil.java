package com.monezhao.common.util;

import com.monezhao.common.exception.BaseException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.util.ObjectUtils;

import java.io.UnsupportedEncodingException;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:51
 * @Description:
 */
@Slf4j
public class CommonUtil {

    /**
     * 验证手机号
     */
    private static final Pattern MOBILE_PATTERN = Pattern.compile("^[1][0-9]{10}$");
    /**
     * 电话号码验证带区号
     */
    private static final Pattern PHONE_WITH_AREA_CODE_PATTERN = Pattern.compile("^[0][1-9]{2,3}-?[0-9]{5,10}$");
    /**
     * 电话号码验证不带区号
     */
    private static final Pattern PHONE_WITHOUT_AREA_CODE_PATTERN = Pattern.compile("^[1-9]{1}[0-9]{5,8}$");
    private static final String ZERO = "0";

    public static String trimToEmptyStr(String str) {
        return StringUtils.trimToEmpty(str);
    }

    public static boolean isEmptyObject(Object object) {
        return ObjectUtils.isEmpty(object);
    }

    public static void isEmptyObject(Object object, String message) {
        if (isEmptyObject(object)) {
            throw new BaseException(message);
        }
    }

    public static boolean isNotEmptyObject(Object object) {
        return !ObjectUtils.isEmpty(object);
    }

    public static boolean isEmptyStr(String str) {
        return StringUtils.isEmpty(str);
    }

    public static void isEmptyStr(String str, String message) {
        if (isEmptyStr(str)) {
            throw new BaseException(message);
        }
    }

    public static boolean isNotEmptyStr(String str) {
        return !StringUtils.isEmpty(str);
    }

    public static boolean isEmptyAfterTrim(String str) {
        return StringUtils.isEmpty(StringUtils.trimToEmpty(str));
    }

    public static void isEmptyAfterTrim(String str, String message) {
        if (isEmptyAfterTrim(str)) {
            throw new BaseException(message);
        }
    }

    public static boolean isNotEmptyAfterTrim(String str) {
        return !isEmptyAfterTrim(str);
    }

    public static <T> T isEmptyDefault(T source, T df) {
        return isNotEmptyObject(source) ? source : df;
    }

    /**
     * 验证[某字符串]是否存在于逗号分隔的字符串中
     *
     * @param str       【abc,123,www】
     * @param substr    【123】
     * @param sepatator 【,】
     * @return
     */
    public static boolean isExist(String str, String substr, String sepatator) {
        if (str == null || str.trim().length() == 0) {
            return false;
        }
        if (substr == null || substr.trim().length() == 0) {
            return false;
        }
        String[] strArr = str.split(sepatator);
        int size = strArr.length;
        for (int i = 0; i < size; i++) {
            if (strArr[i].equals(substr)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 对String型的id号串,拆分成数组 【abc,123,www】将拆分成str数组
     *
     * @param srcIds
     * @param splitChar
     * @return
     */
    public static String[] getIds(String srcIds, String splitChar) {
        String[] ids = null;
        // 第一个字符是splitchar
        boolean spBegin = false;

        if (srcIds == null || srcIds.length() == 0) {
            return null;
        }
        if (srcIds.indexOf(splitChar) == 0) {
            spBegin = true;
        }

        String[] strSplitIds = srcIds.trim().split(splitChar);
        int len = strSplitIds.length;
        if (spBegin) {
            if (len > 1) {
                ids = new String[len - 1];
                for (int i = 1; i < len; i++) {
                    ids[i - 1] = strSplitIds[i];
                }
            } else {
                return null;
            }
        } else {
            ids = new String[len];
            for (int i = 0; i < len; i++) {
                ids[i] = strSplitIds[i];
            }
        }

        return ids;
    }

    /**
     * 中文字符串转为utf-8格式
     *
     * @param s
     * @return
     */
    public static String toUtf8String(String s) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 0 && c <= 255) {
                sb.append(c);
            } else {
                byte[] b;
                try {
                    b = Character.toString(c).getBytes("utf-8");
                } catch (Exception ex) {
                    log.error(ex.getMessage(), ex);
                    b = new byte[0];
                }
                for (int j = 0; j < b.length; j++) {
                    int k = b[j];
                    if (k < 0) {
                        k += 256;
                    }
                    sb.append("%" + Integer.toHexString(k).toUpperCase());
                }
            }
        }
        return sb.toString();
    }

    /**
     * 根据指定的分隔符转换字符串
     *
     * @param source    原字符串
     * @param separator 分隔符
     * @return 例子：'1,2,3,4' 转换为'1','2','3','4'
     */
    public static String castStringBySeparator(String source, String separator) {
        source = source.replace(separator, "'" + separator + "'");
        source = "'" + source + "'";
        return source;
    }

    /**
     * 手机号验证
     *
     * @param str
     * @return 验证通过返回true
     */
    public static boolean isMobile(String str) {
        boolean b = false;
        Matcher m = MOBILE_PATTERN.matcher(str);
        b = m.matches();
        return b;
    }

    /**
     * 电话号码验证
     *
     * @param str
     * @return 验证通过返回true
     */
    public static boolean isPhone(String str) {
        Matcher m = null;
        boolean b = false;
        if (str.startsWith(ZERO)) {
            m = PHONE_WITH_AREA_CODE_PATTERN.matcher(str);
            b = m.matches();
        } else {
            m = PHONE_WITHOUT_AREA_CODE_PATTERN.matcher(str);
            b = m.matches();
        }
        return b;
    }

    /**
     * 获取32位唯一的uuid,不带横杠
     *
     * @return
     */
    public static String getUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 获取32位唯一的uuid,带横杠
     *
     * @return
     */
    public static String getUuid2() {
        return UUID.randomUUID().toString();
    }

    public static String addLike(String str) {
        return "'%" + str + "%'";
    }

    public static String addLikeLeft(String str) {
        return "'%" + str + "'";
    }

    public static String addLikeRight(String str) {
        return "'" + str + "%'";
    }

    /**
     * 根据指定编码切割字符串
     *
     * @param str
     * @param num
     * @param charsetName
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String cutString(String str, int num, String charsetName) {
        try {
            int length = str.getBytes(charsetName).length;
            if (length > num) {
                str = str.substring(0, str.length() - 1);
                str = cutString(str, num, charsetName);
            }
            return str;
        } catch (UnsupportedEncodingException e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 格式化文本, {} 表示占位符<br>
     * 此方法只是简单将占位符 {} 按照顺序替换为参数<br>
     * 如果想输出 {} 使用 \\转义 { 即可，如果想输出 {} 之前的 \ 使用双转义符 \\\\ 即可<br>
     * 例：<br>
     * 通常使用：format("this is {} for {}", "a", "b") -> this is a for b<br>
     * 转义{}： format("this is \\{} for {}", "a", "b") -> this is \{} for a<br>
     * 转义\： format("this is \\\\{} for {}", "a", "b") -> this is \a for b<br>
     *
     * @param template 文本模板，被替换的部分用 {} 表示
     * @param params   参数值
     * @return 格式化后的文本
     */
    public static String format(String template, Object... params) {
        if (isEmptyStr(template) || isEmptyObject(params)) {
            return template;
        }
        return StringFormatter.format(template, params);
    }
}
