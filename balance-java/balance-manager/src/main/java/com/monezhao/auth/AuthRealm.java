package com.monezhao.auth;

import com.monezhao.bean.sys.SysConstants;
import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.common.Constants;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.JwtUtil;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.service.SysConfigService;
import com.monezhao.service.SysUserService;
import com.monezhao.shiro.JwtToken;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/22 14:59
 * @Description: 权限验证
 */
@Component
@Slf4j
public class AuthRealm extends AuthorizingRealm {

    /**
     * @Lazy 加此标签，防止 sysUserService 事务无效
     */
    @Autowired
    @Lazy
    private SysUserService sysUserService;
    @Autowired
    private SysConfigService sysConfigService;
    @Autowired
    private RedisUtil redisUtil;

    /**
     * 必须重写此方法，不然Shiro会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JwtToken;
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SessionObject sessionObject = (SessionObject) principals.getPrimaryPrincipal();
        SysUser sysUser = sessionObject.getSysUser();
        String roleId = sysUser.getRoleId();

        if (CommonUtil.isEmptyAfterTrim(roleId)) {
            throw new AuthenticationException("请切换角色重新登录!");
        }
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set permissionsSet = null;
        if (sessionObject.getPermissions() != null) {
            permissionsSet = new HashSet<String>(sessionObject.getPermissions());
        } else {
            permissionsSet = new HashSet<String>();
        }
        info.addStringPermissions(permissionsSet);
        return info;
    }

    /**
     * 获取身份验证信息 Shiro中，默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     *
     * @param auth 用户身份信息 token
     * @return 返回封装了用户信息的 AuthenticationInfo 实例
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String token = (String) auth.getCredentials();

        if (CommonUtil.isEmptyStr(token)) {
            throw new AuthenticationException("token不能为空!");
        }
        // 解密获得userId，用于和数据库进行对比
        String userId = JwtUtil.getUserId(token);
        if (userId == null) {
            throw new AuthenticationException("token已失效，请重新登录!");
        }
        // 查询用户信息
        SysUser sysUser = sysUserService.getById(userId);
        if (sysUser == null) {
            throw new AuthenticationException("用户不存在!");
        }
        // 校验token是否超时失效 & 或者账号密码是否错误
        if (!verifyTokenWithRedis(token, userId, sysUser.getPassword())) {
            throw new AuthenticationException("token已失效，请重新登录!");
        }
        // 判断用户状态
        if (!SysConstants.USER_STATUS_1.equals(sysUser.getStatus())) {
            throw new AuthenticationException("账号已被锁定,请联系管理员!");
        }

        SessionObject sessionObject = (SessionObject) redisUtil.get(Constants.PREFIX_USER_SESSION_OBJECT + userId);
        if (sessionObject == null) {
            sessionObject = new SessionObject();
            sessionObject.setSysUser(sysUser);
        }
        log.info("token:" + token);
        return new SimpleAuthenticationInfo(sessionObject, token, getName());
    }

    /**
     * redis缓存中验证token
     *
     * @param token
     * @param userId
     * @param password
     * @return
     */
    public boolean verifyTokenWithRedis(String token, String userId, String password) {
        String userTokenKey = Constants.PREFIX_USER_TOKEN + userId;
        // 校验token有效性，若验证通过，刷新token缓存时间
        if (token.equals(redisUtil.get(userTokenKey)) && JwtUtil.verify(token, userId, password)) {
            String expireTime = sysConfigService.getSysConfig("expireTime");
            long expireTimeL = Long.parseLong(expireTime);
            redisUtil.expire(userTokenKey, expireTimeL);
            redisUtil.expire(Constants.PREFIX_USER_SESSION_OBJECT + userId, expireTimeL);
            return true;
        }
        return false;
    }
}
