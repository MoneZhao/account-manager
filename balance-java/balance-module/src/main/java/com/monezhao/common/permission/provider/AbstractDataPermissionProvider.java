package com.monezhao.common.permission.provider;

import com.monezhao.bean.utilsVo.SessionObject;
import com.monezhao.common.permission.FilterGroup;
import com.monezhao.common.util.CommonUtil;
import com.monezhao.common.util.JacksonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.beanutils.PropertyUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:56
 * @Description: 数据规则数据源策略为系统提供时，应自定义实现类实现AbstractDataPermissionProvider的filter方法
 */
@Slf4j
public abstract class AbstractDataPermissionProvider {

    /**
     * 传入参数为Json格式数据，
     * <p>
     * 若有特殊参数需要特殊处理，可以在实现类中重写该方法
     *
     * @param providerParams
     */
    @SuppressWarnings("unchecked")
    public void setProviderParams(String providerParams) {
        if (CommonUtil.isEmptyAfterTrim(providerParams)) {
            return;
        }
        Map<String, Object> paramsMap = JacksonUtil.strToObj(providerParams, HashMap.class);
        if (paramsMap == null) {
            return;
        }
        for (String key : paramsMap.keySet()) {
            Object value = paramsMap.get(key);
            try {
                PropertyUtils.setSimpleProperty(this, key, value);
            } catch (Exception e) {
                log.info("注入[" + key + "],发生错误");
            }
        }
    }

    /**
     * 返回规则组
     *
     * @param sessionObject
     * @return
     */
    public abstract FilterGroup filter(SessionObject sessionObject);
}
