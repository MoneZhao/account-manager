package com.monezhao.controller.command;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2020/7/7 5:23 下午
 */
@Getter
@Setter
@ApiModel(value = "首页快捷方式")
public class UserShortCut {

    @ApiModelProperty(value = "用户id")
    private String userId;

    @ApiModelProperty(value = "角色id")
    private String roleId;

    @ApiModelProperty(value = "新增快捷方式")
    private List<String> add;

    @ApiModelProperty(value = "删除快捷方式")
    private List<String> del;

}
