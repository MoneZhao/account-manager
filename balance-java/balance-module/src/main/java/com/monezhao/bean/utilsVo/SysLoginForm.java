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
@ApiModel(value = "登录表单")
public class SysLoginForm {

    @ApiModelProperty(value = "用户名")
    private String userId;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "UUID")
    private String uuid;

    @ApiModelProperty(value = "验证码")
    private String captcha;
}
