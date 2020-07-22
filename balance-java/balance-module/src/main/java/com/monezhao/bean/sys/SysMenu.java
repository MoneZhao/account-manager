package com.monezhao.bean.sys;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.monezhao.common.base.BaseEntity;
import com.monezhao.common.validator.constraints.LengthForUtf8;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:47
 * @Description: 菜单
 */
@Getter
@Setter
@TableName("t_sys_menu")
@ApiModel(value = "菜单")
public class SysMenu extends BaseEntity {

    private static final long serialVersionUID = -2801102209123547913L;

    /**
     * 菜单ID
     */
    @TableId
    @NotNull
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "菜单ID")
    private String menuId;

    /**
     * 菜单名称
     */
    @NotNull
    @LengthForUtf8(max = 100)
    @ApiModelProperty(value = "菜单名称")
    private String menuName;

    /**
     * 上级菜单ID
     */
    @LengthForUtf8(max = 32)
    @ApiModelProperty(value = "上级菜单ID")
    private String parentMenuId;

    /**
     * 图标
     */
    @ApiModelProperty(value = "图标")
    @LengthForUtf8(max = 100)
    private String menuIcon;

    /**
     * 菜单URL
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "菜单URL")
    private String menuUrl;

    /**
     * 授权
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "授权")
    private String menuPermissions;

    /**
     * 组件
     */
    @ApiModelProperty(value = "组件")
    @LengthForUtf8(max = 255)
    private String component;

    /**
     * 重定向URL
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "重定向URL")
    private String redirect;

    /**
     * 是否隐藏
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "是否隐藏")
    private String hidden;

    /**
     * 是否路由
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "是否路由")
    private String isRoute;

    /**
     * 路由名称
     */
    @LengthForUtf8(max = 255)
    @ApiModelProperty(value = "路由名称")
    private String routeName;

    /**
     * tagsView是否缓存 1-缓存 0-不缓存
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "tagsView是否缓存 1-缓存 0-不缓存")
    private String isCache;

    /**
     * 是否常驻菜单1-是0-否
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "是否常驻菜单1-是0-否")
    private String affix;

    /**
     * 是否叶子节点
     */
    @LengthForUtf8(max = 1)
    @ApiModelProperty(value = "是否叶子节点")
    private String isLeaf;

    /**
     * 排序号
     */
    @Max(99999)
    @ApiModelProperty(value = "排序号")
    private Integer sortNo;

    @TableField(exist = false)
    private String parentMenuName;
}
