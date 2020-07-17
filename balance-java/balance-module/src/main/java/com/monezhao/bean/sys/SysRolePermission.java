package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:49
 * @Description: 操作权限
 */
@Getter
@Setter
@TableName("t_sys_role_permission")
public class SysRolePermission extends BaseEntity {

    private static final long serialVersionUID = -4905268058234210462L;

    /**
     * 操作权限ID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    private String rolePermissionId;

    /**
     * 角色ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String roleId;

    /**
     * 权限类型
     */
    @NotNull
    @LengthForUtf8(max = 1)
    private String permissionType;

    /**
     * 菜单或功能ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String menuOrFuncId;

    @TableField(exist = false)
    private String menuOrFuncName;

    public SysRolePermission() {
    }

    public SysRolePermission(String permissionType, String menuOrFuncId, String menuOrFuncName) {
        this.permissionType = permissionType;
        this.menuOrFuncId = menuOrFuncId;
        this.menuOrFuncName = menuOrFuncName;
    }
}
