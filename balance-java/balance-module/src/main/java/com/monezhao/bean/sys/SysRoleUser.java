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
 * @Description: 角色和用户关系
 */
@Getter
@Setter
@TableName("t_sys_role_user")
public class SysRoleUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * UUID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @NotNull
    @LengthForUtf8(max = 32)
    private String roleUserId;

    /**
     * 角色ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String roleId;

    /**
     * 用户ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String userId;

    @TableField(exist = false)
    private String userName;

    @TableField(exist = false)
    private String authFilterSql;

    public SysRoleUser() {
    }

    public SysRoleUser(String roleId, String userId) {
        this.roleUserId = roleId + '-' + userId;
        this.roleId = roleId;
        this.userId = userId;
    }
}
