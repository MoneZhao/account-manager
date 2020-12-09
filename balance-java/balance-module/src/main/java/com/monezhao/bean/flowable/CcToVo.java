package com.monezhao.bean.flowable;

import lombok.Data;

/**
 * @author monezhao@163.com
 */
@Data
public class CcToVo {
    private String userId;
    private String userName;

    @Override
    public String toString() {
        return String.format("%s[%s]", this.userName, this.userId);
    }
}
