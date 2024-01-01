package com.monezhao.bean.sys;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 【出差报销】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_travel_expense")
@ApiModel(value = "出差报销")
public class SysTravelExpense extends BaseEntity {

    private static final long serialVersionUID = -2606406626503474250L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @ApiModelProperty(value = "主键id")
    @LengthForUtf8(max = 32)
    private String travelExpenseId;

    /**
     * 出差地点
     */
    @NotNull
    @ApiModelProperty(value = "出差地点")
    @LengthForUtf8(max = 32)
    private String travelPlace;

    /**
     * 报销日期
     */
    @NotNull
    @ApiModelProperty(value = "报销日期")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date requestDate;

    /**
     * 到账日期
     */
    @ApiModelProperty(value = "到账日期")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date getDate;

    /**
     * 报账天数
     */
    @ApiModelProperty(value = "报账天数")
    @Max(99999)
    private Integer useDay;

    /**
     * 实际花费
     */
    @NotNull
    @ApiModelProperty(value = "实际花费")
    @DecimalMax("999999999.99")
    private BigDecimal useNumber;

    /**
     * 报销金额
     */
    @NotNull
    @ApiModelProperty(value = "报销金额")
    @DecimalMax("999999999.99")
    private BigDecimal requestNumber;

    /**
     * 到账金额
     */
    @ApiModelProperty(value = "到账金额")
    @DecimalMax("999999999.99")
    private BigDecimal getNumber;

    /**
     * 得利
     */
    @ApiModelProperty(value = "得利")
    @DecimalMax("999999999.99")
    private BigDecimal addNumber;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注")
    @LengthForUtf8(max = 255)
    private String remark;

    /**
     * 是否删除
     */
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    @ExcelIgnore
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "是否删除")
    private Date deleteType;

}