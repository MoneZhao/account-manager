package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:49
 * @Description: 角色
 */
@Getter
@Setter
@TableName("t_sys_role")
@ApiModel(value = "角色")
public class SysRole extends BaseEntity {

    private static final long serialVersionUID = 79866219961486780L;

    /**
     * 角色ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "角色ID")
    private String roleId;

    /**
     * 角色名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "角色名称")
    private String roleName;

    /**
     * 排序号
     */
    @NotNull
    @Max(9999)
    @ApiModelProperty(value = "排序号")
    private Integer sortNo;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "备注")
    private String remark;

}
