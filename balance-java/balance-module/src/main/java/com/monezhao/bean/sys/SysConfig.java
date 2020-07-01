package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
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
public class SysConfig extends BaseEntity {

    private static final long serialVersionUID = 1581735999210523657L;

    /**
     * 系统参数ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    private String configId;

    /**
     * 系统参数名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String configName;

    /**
     * 系统参数值
     */
    @NotNull
    @LengthForUtf8(max = 255)
    private String configValue;

    /**
     * 排序号
     */
    @NotNull
    @Max(9999)
    private Integer sortNo;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    private String remark;

}
