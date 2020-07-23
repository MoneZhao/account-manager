package com.monezhao.bean.sys;

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
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:48
 * @Description: 机构
 */
@Getter
@Setter
@TableName("t_sys_org")
@ApiModel(value = "机构")
public class SysOrg extends BaseEntity {

    private static final long serialVersionUID = 8364134594255584785L;

    /**
     * 机构ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "机构ID")
    private String orgId;

    /**
     * 机构名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "机构名称")
    private String orgName;

    /**
     * 上级机构ID
     */
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "上级机构ID")
    private String parentOrgId;

    /**
     * 机构简称
     */
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "机构简称")
    private String shortName;

    /**
     * 机构类型
     */
    @LengthForUtf8(max = 4)
    @ApiModelProperty(value = "机构类型")
    private String orgType;

    /**
     * 机构级次
     */
    @NotNull
    @LengthForUtf8(max = 2)
    @ApiModelProperty(value = "机构级次")
    private String orgLevel;

    /**
     * 组织机构路径
     */
    @NotNull
    @LengthForUtf8(max = 200)
    @ApiModelProperty(value = "组织机构路径")
    private String orgLevelCode;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "备注")
    private String remark;

    /**
     * 是否叶子节点
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "是否叶子节点")
    private String isLeaf;

    @TableField(exist = false)
    @ApiModelProperty(hidden = true)
    private String parentOrgName;

    @TableField(exist = false)
    @ApiModelProperty(hidden = true)
    private String authFilterSql;

}
