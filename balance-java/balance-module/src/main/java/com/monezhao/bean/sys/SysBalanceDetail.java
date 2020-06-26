package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.DecimalMax;
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

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    private String balanceDetailId;

    /**
     * 账户余额
     */
    @NotNull
    @DecimalMax("999999999.99")
    private double account = 0;

    /**
     * 账户类型
     */
    @NotNull
    @LengthForUtf8(max = 4)
    private String accountType;

    /**
     * 主表id
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String balanceMainId;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    private String remark;

}