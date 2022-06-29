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
 * 【账户余额】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_balance_main")
@ApiModel(value = "账户余额")
public class SysBalanceMain extends BaseEntity {

    private static final long serialVersionUID = -812196458744674160L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "主键id")
    private String balanceMainId;

    /**
     * 账户余额
     */
    @DecimalMax("999999999.99")
    @ExcelProperty("账户余额")
    @ApiModelProperty(value = "账户余额")
    private BigDecimal account = BigDecimal.valueOf(0);

    /**
     * 记录时间
     */
    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty("记录时间")
    @ApiModelProperty(value = "记录时间")
    private Date accountDate;

    /**
     * 所属用户
     */
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "所属用户")
    private String userId;

    /**
     * 用户名
     *
     * @TableField(exist = false)之后要加上一行注解
     * @ApiModelProperty(hidden = true)
     */
    @TableField(exist = false)
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private String userName;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ExcelProperty("备注")
    @ApiModelProperty(value = "备注")
    private String remark;

    /**
     * 是否删除
     */
    @Max(9)
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    @ExcelIgnore
    @ApiModelProperty(value = "是否删除")
    private Integer deleteType;

    @Version
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private int version;

}