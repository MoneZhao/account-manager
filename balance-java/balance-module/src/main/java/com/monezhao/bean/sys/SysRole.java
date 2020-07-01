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
 * @Date: 2020/5/23 9:49
 * @Description: 角色
 */
@Getter
@Setter
@TableName("t_sys_role")
public class SysRole extends BaseEntity {

    private static final long serialVersionUID = 79866219961486780L;

    /**
     * 角色ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    private String roleId;

    /**
     * 角色名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String roleName;

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
