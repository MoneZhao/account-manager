package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "岗位和用户关系")
public class SysPostUser extends BaseEntity {

    private static final long serialVersionUID = 7986321784580806527L;

    /**
     * UUID
     */
    @TableId(type = IdType.ASSIGN_UUID)
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "主键id")
    private String postUserId;

    /**
     * 岗位ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "岗位ID")
    private String postId;

    /**
     * 用户ID
     */
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "用户ID")
    private String userId;

    @TableField(exist = false)
    @ApiModelProperty(value = "用户名")
    private String userName;

    @TableField(exist = false)
    private String authFilterSql;

}
