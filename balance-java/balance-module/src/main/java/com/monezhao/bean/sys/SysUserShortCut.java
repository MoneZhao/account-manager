package com.monezhao.bean.sys;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @date 2020/7/7 5:45 下午
 */
@Getter
@Setter
@TableName("t_sys_user_short_cut")
public class SysUserShortCut extends BaseEntity {

    private static final long serialVersionUID = 7282073355074124814L;

    /**
     * 主键ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ExcelProperty("主键ID")
    private String userShortCutId;

    /**
     * 用户ID
     */
    @LengthForUtf8(max = 32)
    @ExcelProperty("用户ID")
    @NotNull
    private String userId;

    /**
     * 菜单ID
     */
    @LengthForUtf8(max = 32)
    @ExcelProperty("菜单ID")
    @NotNull
    private String menuId;

}
