package com.monezhao.controller.command;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @date 2023-04-14 上午 09:55
 */
@Data
public class LoginCommand {
    /**
     * 是否使用验证码
     */
    private String useCaptcha;

    /**
     * token过期时间
     */
    private String expireTime;
}
