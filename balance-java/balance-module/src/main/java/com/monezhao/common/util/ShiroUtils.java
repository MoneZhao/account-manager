package com.monezhao.common.util;

import com.monezhao.bean.sys.SysUser;
import com.monezhao.bean.utilsVo.SessionObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:55
 * @Description:
 */
public class ShiroUtils {

    public static Session getSession() {
        return SecurityUtils.getSubject().getSession();
    }

    public static Subject getSubject() {
        return SecurityUtils.getSubject();
    }

    public static SessionObject getSessionObject() {
        return (SessionObject) SecurityUtils.getSubject().getPrincipal();
    }

    public static SysUser getSysUser() {
        SessionObject sessionObject = getSessionObject();
        if (sessionObject == null) {
            return null;
        }
        return sessionObject.getSysUser();
    }

    public static String getUserId() {
        SysUser sysUser = getSysUser();
        if (sysUser == null) {
            return null;
        }
        return sysUser.getUserId();
    }

    public static void setSessionAttribute(Object key, Object value) {
        getSession().setAttribute(key, value);
    }

    public static Object getSessionAttribute(Object key) {
        return getSession().getAttribute(key);
    }

    public static boolean isLogin() {
        return SecurityUtils.getSubject().getPrincipal() != null;
    }
}
