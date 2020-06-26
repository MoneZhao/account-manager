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
 * @Description: 功能
 */
@Getter
@Setter
@TableName("t_sys_func")
public class SysFunc extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 功能ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    private String funcId;

    /**
     * 功能名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    private String funcName;

    /**
     * 菜单ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String menuId;

    /**
     * 授权
     */
    @LengthForUtf8(max = 255)
    private String funcPermissions;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    private String remark;

    /**
     * 排序号
     */
    @Max(9999)
    private Integer sortNo;

}
