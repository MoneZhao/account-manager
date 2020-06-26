package com.monezhao.common.permission.provider;

import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.common.permission.FilterGroup;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:57
 * @Description: 空的DataPermissionProvider，可以用于测试
 */
public class NullDataPermissionProvider extends AbstractDataPermissionProvider {
    @Override
    public FilterGroup filter(SessionObject sessionObject) {
        return null;
    }
}
