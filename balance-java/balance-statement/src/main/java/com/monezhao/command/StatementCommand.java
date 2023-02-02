package com.monezhao.command;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.monezhao.validate.ValidGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author monezhao@163.com
 * @date 2020/10/23 11:39 上午
 */
@Data
@NoArgsConstructor
@ApiModel(value = "报表查询")
public class StatementCommand {

    @NotNull(message = "开始月份不能为空", groups = {
            ValidGroup.MainGroup.class,
            ValidGroup.DetailGroup.class,
    })
    @ApiModelProperty(value = "开始月份")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date startMonth;

    @NotNull(message = "结束月份不能为空", groups = {
            ValidGroup.MainGroup.class,
            ValidGroup.DetailGroup.class,
    })
    @ApiModelProperty(value = "结束月份")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date endMonth;

    @NotNull(message = "账户类型不能为空", groups = {
            ValidGroup.DetailGroup.class,
    })
    @ApiModelProperty(value = "账户类型")
    private String balanceType;

    @NotNull(message = "查询类别不能为空", groups = {
            ValidGroup.MainGroup.class,
    })
    @ApiModelProperty(value = "查询年月类别: 0 月, 1 年")
    private String queryType;

}
