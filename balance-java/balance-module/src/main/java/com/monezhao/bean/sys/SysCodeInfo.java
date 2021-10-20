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
 * @Date: 2020/5/23 9:42
 * @Description: 字典信息
 */
@Getter
@Setter
@TableName("t_sys_code_info")
@ApiModel(value = "代码信息")
public class SysCodeInfo extends BaseEntity {

    private static final long serialVersionUID = 2436981029048356619L;

    /**
     * 代码信息ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "代码信息ID")
    private String codeInfoId;

    /**
     * 代码类别ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "代码类别ID")
    private String codeTypeId;

    /**
     * 下拉框值
     */
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "下拉框值")
    private String value;

    /**
     * 下拉框内容
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "下拉框内容")
    private String content;

    /**
     * 上级联动下拉框值
     */
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "上级联动下拉框值")
    private String parentValue;

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

    /**
     * 是否显示
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "是否显示")
    private String isOk;

}
