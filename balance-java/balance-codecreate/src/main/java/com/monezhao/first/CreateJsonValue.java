package com.monezhao.first;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.monezhao.util.CodeUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;

import java.beans.PropertyDescriptor;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:49
 * @Description:
 */
@Slf4j
public class CreateJsonValue {

    public static void create(String createTableName) throws Exception {
        // T_SYS_CODE_TYPE变成SYS_CODE_TYPE
        String moduleId = StringUtils.substringAfter(createTableName, "t_");
        // 用T_SYS_CODE_TYPE表的方式命名变量,更好理解
        String aSysCodeType = CodeUtil.getTuoFengName(moduleId, true);
        // String _sysCodeType = CodeUtil.getTuoFengName(moduleId, false);
        String sysUpper = StringUtils.substringBefore(moduleId, "_");
        String sys = sysUpper.toLowerCase();

        String classFullName = "com.monezhao.bean." + aSysCodeType;
        Object object = Class.forName(classFullName).newInstance();
        // Field[] fields = object.getClass().getDeclaredFields();
        // Method[] methods = object.getClass().getDeclaredMethods();
        String defaultValue = "1";
        Date dafaultDateValue = new Date();
        PropertyDescriptor[] origDescriptors = PropertyUtils.getPropertyDescriptors(object);
        String name, type;
        for (int i = 0; i < origDescriptors.length; i++) {
            name = origDescriptors[i].getName();
            type = origDescriptors[i].getPropertyType().toString();
            if ("class".equals(name) || !PropertyUtils.isReadable(object, name)) {
                continue;
            }
            Object temp;
            switch (type) {
                case "class java.lang.Integer":
                    temp = Integer.parseInt(defaultValue);
                    break;
                case "class java.math.BigDecimal":
                    temp = new BigDecimal(defaultValue);
                    break;
                case "class java.lang.Short":
                    temp = Short.parseShort(defaultValue);
                    break;
                case "class java.lang.Long":
                    temp = Long.parseLong(defaultValue);
                    break;
                case "class java.lang.Float":
                    temp = Float.parseFloat(defaultValue);
                    break;
                case "class java.lang.Double":
                    temp = Double.parseDouble(defaultValue);
                    break;
                case "class java.util.Date":
                    temp = dafaultDateValue;
                    break;
                default:
                    temp = defaultValue;
                    break;
            }
            try {
                PropertyUtils.setSimpleProperty(object, name, temp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        String result = new ObjectMapper().writeValueAsString(object);
        log.info(result);
    }
}
