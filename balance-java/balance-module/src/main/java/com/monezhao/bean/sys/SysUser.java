package com.monezhao.bean.sys;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:49
 * @Description: 用户
 */
@Getter
@Setter
@TableName("t_sys_user")
@ApiModel(value = "用户")
public class SysUser extends BaseEntity {

    private static final long serialVersionUID = 5991569093540788491L;

    /**
     * 用户ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    @ExcelProperty("用户ID")
    @ApiModelProperty(value = "用户ID")
    private String userId;

    /**
     * 用户姓名
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ExcelProperty("用户姓名")
    @ApiModelProperty(value = "用户姓名")
    private String userName;

    /**
     * 密码
     */
    @JsonIgnore
    @ExcelIgnore
    @ApiModelProperty(value = "密码")
    private String password;

    @JsonIgnore
    @ExcelIgnore
    @ApiModelProperty(value = "盐")
    private String salt;

    /**
     * 性别
     */
    @LengthForUtf8(max = 1)
    @ExcelProperty(value = "性别(1男 2女 3保密)")
    @ApiModelProperty(value = "性别")
    private String sex;

    /**
     * 所属角色ID
     */
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "所属角色ID")
    private String roleId;

    /**
     * 所属机构ID
     */
    @LengthForUtf8(max = 32)
    @ExcelProperty("所属机构")
    @ApiModelProperty(value = "所属机构ID")
    private String orgId;

    /**
     * 手机号码
     */
    @LengthForUtf8(max = 20)
    @ExcelProperty("手机号")
    @ApiModelProperty(value = "手机号码")
    private String mobile;

    /**
     * 身份证号码
     */
    @LengthForUtf8(max = 20)
    @ExcelProperty("身份证号")
    @ApiModelProperty(value = "身份证号码")
    private String idCardNo;

    /**
     * 邮箱
     */
    @LengthForUtf8(max = 100)
    @ExcelProperty("email")
    @ApiModelProperty(value = "邮箱")
    private String email;

    /**
     * 用户状态
     */
    @LengthForUtf8(max = 1)
    @ExcelIgnore
    @ApiModelProperty(value = "用户状态")
    private String status;

    /**
     * 排序号
     */
    @Max(999999)
    @ExcelProperty("排序号")
    @ApiModelProperty(value = "排序号")
    private Integer sortNo;

    /**
     * 头像id
     */
    @LengthForUtf8(max = 32)
    @ExcelIgnore
    @ApiModelProperty(value = "头像id")
    private String picId;

    /**
     * 备注
     */
    @LengthForUtf8(max = 255)
    @ExcelProperty("备注")
    @ApiModelProperty(value = "备注")
    private String remark;

    @TableField(exist = false)
    @ExcelProperty("机构名称")
    @ApiModelProperty(hidden = true)
    private String orgName;

    @TableField(exist = false)
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private String authFilterSql;

    /**
     * 机构主键集合
     */
    @TableField(exist = false)
    @ExcelIgnore
    @ApiModelProperty(hidden = true)
    private List<String> orgList;
}
