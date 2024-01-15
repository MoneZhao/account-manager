package vip.xiaonuo.biz.modular.statement.param;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author monezhao@163.com
 * @date 2024/1/12 2:49 PM
 */
@Data
@NoArgsConstructor
@ApiModel(value = "报表详情查询")
public class StatementDetailCommand {

    @NotNull(message = "开始月份不能为空")
    @ApiModelProperty(value = "开始月份")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date startMonth;

    @NotNull(message = "结束月份不能为空")
    @ApiModelProperty(value = "结束月份")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date endMonth;

    @NotBlank(message = "账户类型不能为空")
    @ApiModelProperty(value = "账户类型")
    private String balanceType;

}
