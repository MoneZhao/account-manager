package com.monezhao.bean.utilsVo;

import com.monezhao.bean.sys.SysOrg;
import com.monezhao.bean.sys.SysRole;
import com.monezhao.bean.sys.SysUser;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:43
 * @Description:
 */
@Data
public class SessionObject implements Serializable {

    public static final String BEAN_ID = "sessionObject";
    private static final long serialVersionUID = 938060802653285321L;
    private String token;
    private String avatar;
    private SysUser sysUser;
    private SysOrg sysOrg;
    private SysRole sysRole;
    private List<SysRole> sysRoles;
    private List<Route> routes;
    private List<String> funcIds;
    private List<String> permissions;
    private Date loginTime;
    private String ipAddr;
}
