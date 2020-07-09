package com.monezhao.bean.sys;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

/**
 * 【账户明细】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_balance_detail")
public class SysBalanceDetail extends BaseEntity {

    private static final long serialVersionUID = 2629999488067085680L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ExcelProperty("主键")
    private String balanceDetailId;

    /**
     * 账户余额
     */
    @NotNull
    @DecimalMax("999999999.99")
    @ExcelProperty("账户余额")
    private double account = 0;

    /**
     * 账户类型
     */
    @NotNull
    @LengthForUtf8(max = 4)
    @ExcelProperty("账户类型")
    private String balanceType;

    /**
     * 账户名
     */
    @TableField(exist = false)
    @ExcelProperty("账户名")
    private String balanceName;

    /**
     * 主表id
     */
    @NotNull
    @LengthForUtf8(max = 32)
    @ExcelProperty("主表id")
    private String balanceMainId;

    /**
     * 所属用户id
     */
    @LengthForUtf8(max = 32)
    @ExcelProperty("用户id")
    private String userId;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ExcelProperty("备注")
    private String remark;

    @Max(9)
    @TableLogic
    @TableField(fill = FieldFill.INSERT)
    @ExcelIgnore
    private Integer deleteType;

}