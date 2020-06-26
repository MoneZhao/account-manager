package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 【账户余额主】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_balance_main")
public class SysBalanceMain extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    private String balanceMainId;

    /**
     * 账户余额
     */
    @DecimalMax("999999999.99")
    private double account = 0;

    /**
     * 记录时间
     */
    @NotNull
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date accountDate;

    /**
     * 所属用户
     */
    @LengthForUtf8(max = 32)
    private String userId;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    private String remark;

}