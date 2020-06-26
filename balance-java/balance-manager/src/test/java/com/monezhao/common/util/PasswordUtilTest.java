package com.monezhao.common.util;

import com.monezhao.bean.sys.SysUser;
import com.monezhao.common.Constants;
import com.monezhao.config.DefaultPasswordConfig;
import com.monezhao.modules.sys.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author monezhao@163.com
 * @date 2020/6/13 9:41 上午
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j
public class PasswordUtilTest {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private DefaultPasswordConfig defaultPasswordConfig;

    @Test
    public void md5Encode() {
        SysUser sysUser = sysUserService.getById("admin");
        String salt = PasswordUtil.randomGen(8);
        // 默认密码
        String defaultPassword = (String) redisUtil.get(
                Constants.PREFIX_SYS_CONFIG + "defaultPassword",
                defaultPasswordConfig.getDefaultPassword()
        );
        String password = PasswordUtil.encrypt(PasswordUtil.md5Encode(defaultPassword), salt);
        sysUser.setSalt(salt);
        sysUser.setPassword(password);
        sysUserService.updateById(sysUser);
    }

}