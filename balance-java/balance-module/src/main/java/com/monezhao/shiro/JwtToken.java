package com.monezhao.shiro;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:38
 * @Description: JWT token
 */
public class JwtToken implements AuthenticationToken {

    private static final long serialVersionUID = 7012272403032646197L;

    private final String token;

    public JwtToken(String token) {
        this.token = token;
    }

    @Override
    public Object getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
