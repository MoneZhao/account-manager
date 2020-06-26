package com.monezhao.common.permission.provider;

import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.common.permission.FilterGroup;
import com.monezhao.common.util.CommonUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:57
 * @Description: 测试数据库后台返回provider
 */
@Getter
@Setter
@Slf4j
public class TestSystemDataPermissionProvider extends AbstractDataPermissionProvider {

    /**
     * 数据库配置参数，特别注意，如果数据库传入的参数有作为查询条件，应使用SQLFilter.sqlInject(param)防止sql注入
     */
    private String alias;
    private String columnName;
    private String dbParam1;
    private int dbParam2;

    @Override
    public FilterGroup filter(SessionObject sessionObject) {
        // 测试请打开注释
        log.info(this.alias);
        log.info(this.columnName);
        log.info(this.dbParam1);
        log.info(String.valueOf(this.dbParam2));
        String alias = CommonUtil.isEmptyDefault(this.alias, "o");
        log.info(alias);
        String columnName = CommonUtil.isEmptyDefault(this.columnName, "columnName");
        log.info(columnName);
        return null;
    }
}
