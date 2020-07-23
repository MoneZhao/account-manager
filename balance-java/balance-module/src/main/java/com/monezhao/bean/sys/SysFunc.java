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
 * @Date: 2020/5/23 9:46
 * @Description: 功能
 */
@Getter
@Setter
@TableName("t_sys_func")
@ApiModel(value = "功能")
public class SysFunc extends BaseEntity {

    private static final long serialVersionUID = -2223614068364911533L;

    /**
     * 功能ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "功能ID")
    private String funcId;

    /**
     * 功能名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "功能名称")
    private String funcName;

    /**
     * 菜单ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "菜单ID")
    private String menuId;

    /**
     * 授权
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "授权")
    private String funcPermissions;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "备注")
    private String remark;

    /**
     * 排序号
     */
    @Max(9999)
    @ApiModelProperty(value = "排序号")
    private Integer sortNo;

}
