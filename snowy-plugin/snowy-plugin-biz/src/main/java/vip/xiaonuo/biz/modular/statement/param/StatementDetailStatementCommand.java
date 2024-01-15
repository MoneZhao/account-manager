package vip.xiaonuo.biz.modular.statement.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

/**
 * @author monezhao@163.com
 * @date 2024/1/12 2:49 PM
 */
@Data
@NoArgsConstructor
@ApiModel(value = "报表详情查询")
public class StatementDetailStatementCommand {

    /**
     * 报表查询时间
     */
    @ApiModelProperty("报表查询时间")
    @NotBlank(message = "查询时间不能为空")
    private String statementDate;

    /**
     * 报表查询年月类别: 0 月, 1 年
     */
    @ApiModelProperty("报表查询年月类别")
    @NotBlank(message = "查询类别不能为空")
    private String queryType;

}
