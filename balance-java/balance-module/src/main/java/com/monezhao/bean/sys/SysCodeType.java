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
 * @Description: 字典类别
 */
@Getter
@Setter
@TableName("t_sys_code_type")
public class SysCodeType extends BaseEntity {

    private static final long serialVersionUID = -5982006815084154323L;

    /**
     * 代码类别ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    private String codeTypeId;

    /**
     * 代码类别名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String codeTypeName;

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
