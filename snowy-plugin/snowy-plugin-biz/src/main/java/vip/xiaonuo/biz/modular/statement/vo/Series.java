package vip.xiaonuo.biz.modular.statement.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2024/1/12 2:50 PM
 */
@Data
public class Series {
    //数据名称
    private String name;
    //类型
    private String type;
    //折线是否平滑
    private Boolean smooth;
    //数据列表
    private List<BigDecimal> data;
    //最大宽度
    private Integer barMaxWidth = 100;
}
