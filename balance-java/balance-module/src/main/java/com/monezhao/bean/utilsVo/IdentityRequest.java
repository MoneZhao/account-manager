package com.monezhao.bean.utilsVo;

import lombok.Getter;
import lombok.Setter;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:42
 * @Description:
 */
@Getter
@Setter
public class IdentityRequest {
    private String processDefinitionId;
    private String taskId;
    private String identityId;
    private String identityType;
}
