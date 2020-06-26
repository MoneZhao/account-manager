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
 * @Description: 岗位和用户关系
 */
@Getter
@Setter
@TableName("t_sys_post_user")
public class SysPostUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * UUID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @NotNull
    @LengthForUtf8(max = 32)
    private String postUserId;

    /**
     * 岗位ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    private String postId;

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

    public SysPostUser() {
    }

    public SysPostUser(String postId, String userId) {
        this.postUserId = postId + '-' + userId;
        this.postId = postId;
        this.userId = userId;
    }
}
