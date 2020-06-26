package com.monezhao.bean.utilsVo;

import lombok.Data;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:41
 * @Description:
 */
@Data
public class SysPasswordForm {
    /**
     * 原密码
     */
    private String password;
    /**
     * 新密码
     */
    private String newPassword;

}
