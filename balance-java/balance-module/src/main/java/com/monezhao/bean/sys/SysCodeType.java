package com.monezhao.bean.sys;

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
 * @Description: 字典类别
 */
@Getter
@Setter
@TableName("t_sys_code_type")
@ApiModel(value = "代码类别")
public class SysCodeType extends BaseEntity {

    private static final long serialVersionUID = -5982006815084154323L;

    /**
     * 代码类别ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "代码类别ID")
    private String codeTypeId;

    /**
     * 代码类别名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "代码类别名称")
    private String codeTypeName;

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
