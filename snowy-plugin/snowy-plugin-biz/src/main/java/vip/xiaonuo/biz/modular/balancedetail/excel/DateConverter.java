package vip.xiaonuo.biz.modular.balancedetail.excel;

/**
 * @author monezhao@163.com
 * @date 2024/1/25 8:34
 */

import cn.hutool.core.date.DateUtil;
import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.converters.ReadConverterContext;
import com.alibaba.excel.converters.WriteConverterContext;
import com.alibaba.excel.metadata.data.WriteCellData;

import java.util.Date;

/**
 * 将Excel时间格式转化为yyyy-MM-dd
 * @author monezhao
 */
public class DateConverter implements Converter<Date> {

    @Override
    public Class<Date> supportJavaTypeKey() {
        return Date.class;
    }


    @Override
    public WriteCellData<String> convertToExcelData(WriteConverterContext<Date> context) {
        Date date = context.getValue();
        if (date == null) {
            return null;
        }
        return new WriteCellData<>(DateUtil.formatDate(date));
    }

    @Override
    public Date convertToJavaData(ReadConverterContext<?> context) {
        return DateUtil.parseDate(context.getReadCellData().getStringValue()).toJdkDate();
    }
}
