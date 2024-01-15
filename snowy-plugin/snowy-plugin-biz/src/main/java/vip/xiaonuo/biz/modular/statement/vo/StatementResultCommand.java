package vip.xiaonuo.biz.modular.statement.vo;

import lombok.Data;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2024/1/12 2:49 PM
 */
@Data
public class StatementResultCommand {

    //X轴数据
    private List<String> x;

    //Y轴数据
    private List<Series> y;

    //X轴标题
    private String xTitle;

    //Y轴标题
    private String yTitle;

    //图表标题
    private String title;

}
