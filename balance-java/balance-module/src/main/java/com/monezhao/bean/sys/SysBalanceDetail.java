package com.monezhao.bean.sys;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
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
 * 【账户明细】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_balance_detail")
@ApiModel(value = "账户明细")
public class SysBalanceDetail extends BaseEntity {

    private static final long serialVersionUID = 2629999488067085680L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "主键id")
    private String balanceDetailId;

    /**
     * 账户余额
     */
    @NotNull
    @DecimalMax("999999999.99")
    @ExcelProperty("账户余额")
    @ApiModelProperty(value = "账户余额")
    private BigDecimal account = BigDecimal.valueOf(0);

    /**
     * 账户类型
     */
    @NotNull
    @LengthForUtf8(max = 4)
    @ExcelIgnore
    @ApiModelProperty(value = "账户类型")
    private String balanceType;

    /**
     * 账户类型名
     */
    @TableField(exist = false)
    @ExcelProperty("账户类型名")
    @ApiModelProperty(hidden = true)
    private String balanceName;

    /**
     * 主表id
     */
    @NotNull
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "主表id")
    private String balanceMainId;

    /**
     * 所属用户id
     */
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "所属用户id")
    private String userId;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ExcelProperty("备注")
    @ApiModelProperty(value = "备注")
    private String remark;

    @Max(9)
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    @ExcelIgnore
    @ApiModelProperty(value = "是否删除")
    private Integer deleteType;

    /**
     * 记录时间
     */
    @TableField(exist = false)
    @ApiModelProperty(hidden = true)
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("记录时间")
    private Date accountDate;

    @Version
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private int version;

}