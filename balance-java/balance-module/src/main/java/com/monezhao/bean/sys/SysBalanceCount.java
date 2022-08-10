package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

/**
 * 【计入总资产】实体类
 *
 * @author monezhao@163.com
 */
@Getter
@Setter
@TableName("t_sys_balance_count")
@ApiModel(value = "计入总资产")
public class SysBalanceCount extends BaseEntity {

    private static final long serialVersionUID = -1088342659937425413L;

    /**
     * 主键id
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @ApiModelProperty(value = "主键id")
    @LengthForUtf8(max = 32)
    private String balanceCountId;

    /**
     * 账户类型id
     */
    @NotNull
    @ApiModelProperty(value = "账户类型id")
    @LengthForUtf8(max = 32)
    private String codeInfoId;

    /**
     * 是否计入总资产
     */
    @NotNull
    @ApiModelProperty(value = "是否计入总资产")
    @LengthForUtf8(max = 2)
    private String countType;

    /**
     * 所属用户
     */
    @ApiModelProperty(value = "所属用户")
    @LengthForUtf8(max = 32)
    private String userId;

    /**
     * 备注
     */
    @TableField(exist = false)
    @ApiModelProperty(value = "备注")
    private String remark;

    /**
     * 账户类型
     */
    @TableField(exist = false)
    @ApiModelProperty("账户类型")
    private String content;

}