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
 * @Date: 2020/5/23 9:46
 * @Description: 系统配置
 */
@Getter
@Setter
@TableName("t_sys_config")
@ApiModel(value = "系统参数")
public class SysConfig extends BaseEntity {

    private static final long serialVersionUID = 1581735999210523657L;

    /**
     * 系统参数ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "系统参数ID")
    private String configId;

    /**
     * 系统参数名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "系统参数名称")
    private String configName;

    /**
     * 系统参数值
     */
    @NotNull
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "系统参数值")
    private String configValue;

    /**
     * 字段是否可以修改
     */
    @NotNull
    @LengthForUtf8(max = 1)
    private String canUpdate;

    /**
     * 字段是否可以删除
     */
    @NotNull
    @LengthForUtf8(max = 1)
    private String canDelete;

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
