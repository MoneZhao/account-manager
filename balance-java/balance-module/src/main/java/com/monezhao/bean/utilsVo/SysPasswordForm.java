package com.monezhao.bean.utilsVo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:41
 * @Description:
 */
@Data
@ApiModel(value = "修改密码表单")
public class SysPasswordForm {
    /**
     * 原密码
     */
    @ApiModelProperty(value = "原密码")
    private String password;
    /**
     * 新密码
     */
    @ApiModelProperty(value = "新密码")
    private String newPassword;

}
