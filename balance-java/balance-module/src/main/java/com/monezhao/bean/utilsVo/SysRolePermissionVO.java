package com.monezhao.bean.utilsVo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:41
 * @Description:
 */
@Data
public class SysRolePermissionVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String rolePermissionId;
    private String roleId;
    private String permissionType;
    private String menuOrFuncId;
    private String menuUrl;
    private String menuPermissions;
    private String funcMenuId;
    private String funcPermissions;
}
