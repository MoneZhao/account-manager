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
 * @Date: 2020/5/23 9:42
 * @Description: 字典信息
 */
@Getter
@Setter
@TableName("t_sys_code_info")
public class SysCodeInfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 代码信息ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    private String codeInfoId;

    /**
     * 代码类别ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String codeTypeId;

    /**
     * 下拉框值
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String value;

    /**
     * 下拉框内容
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String content;

    /**
     * 上级联动下拉框值
     */
    @LengthForUtf8(max = 100)
    private String parentValue;

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

    /**
     * 是否显示
     */
    @LengthForUtf8(max = 1)
    private String isOk;

}
