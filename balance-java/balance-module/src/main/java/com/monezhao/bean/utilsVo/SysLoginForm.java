package com.monezhao.bean.utilsVo;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:41
 * @Description:
 */
@Data
public class SysLoginForm {
    private String userId;
    private String password;
    private String uuid;
    private String captcha;
}
