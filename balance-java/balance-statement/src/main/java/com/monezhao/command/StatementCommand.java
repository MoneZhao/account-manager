package com.monezhao.command;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
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
    //开始月份
    @NonNull
    @ApiModelProperty(value = "开始月份")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date startMonth;

    //结束月份
    @NotNull
    @ApiModelProperty(value = "结束月份")
    @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date endMonth;
}
