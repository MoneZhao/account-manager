package com.monezhao.common.base;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.ShiroUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:59
 * @Description:
 */
@Component
public class GlobalMetaObjectHandler implements MetaObjectHandler {
    private static final String CREATE_BY = "createBy";
    private static final String CREATE_DATE = "createDate";
    private static final String CREATE_TIME = "createTime";
    private static final String UPDATE_BY = "updateBy";
    private static final String UPDATE_DATE = "updateDate";
    private static final String UPDATE_TIME = "updateTime";
    private static final String DELETE_TYPE = "deleteType";

    @Override
    public void insertFill(MetaObject metaObject) {
        if (isBaseEntity(metaObject)) {
            setBaseEntityInsertFill(metaObject);
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        if (isBaseEntity(metaObject)) {
            setBaseEntityUpdateFill(metaObject);
        }
    }

    private boolean isBaseEntity(MetaObject metaObject) {
        return metaObject.getOriginalObject() instanceof BaseEntity || (metaObject.hasGetter(Constants.ENTITY)
                && metaObject.getValue(Constants.ENTITY) != null && metaObject.getValue(Constants.ENTITY) instanceof BaseEntity);
    }


    private void setBaseEntityInsertFill(MetaObject metaObject) {
        Object createBy = getFieldValByName(CREATE_BY, metaObject);
        if (createBy == null) {
            String currUser = ShiroUtils.getUserId();
            setFieldValByName(CREATE_BY, currUser, metaObject);
        }
        Date now = DateUtil.getNow();
        Object createDate = getFieldValByName(CREATE_DATE, metaObject);
        if (createDate == null) {
            setFieldValByName(CREATE_DATE, now, metaObject);
        }
        Object createTime = getFieldValByName(CREATE_TIME, metaObject);
        if (createTime == null) {
            setFieldValByName(CREATE_TIME, now, metaObject);
        }
        Object deleteType = getFieldValByName(DELETE_TYPE, metaObject);
        if (deleteType == null) {
            setFieldValByName(DELETE_TYPE, DateUtil.strToDate("1900-01-01 00:00:00", "yyyy-MM-dd HH:mm:ss"), metaObject);
        }
    }


    private void setBaseEntityUpdateFill(MetaObject metaObject) {
        Object updateBy = getFieldValByName(UPDATE_BY, metaObject);
        if (updateBy == null) {
            String currUser = ShiroUtils.getUserId();
            setFieldValByName(UPDATE_BY, currUser, metaObject);
        }
        Date now = DateUtil.getNow();
        Object updateDate = getFieldValByName(UPDATE_DATE, metaObject);
        if (updateDate == null) {
            setFieldValByName(UPDATE_DATE, now, metaObject);
        }
        Object updateTime = getFieldValByName(UPDATE_TIME, metaObject);
        if (updateTime == null) {
            setFieldValByName(UPDATE_TIME, now, metaObject);
        }
    }
}
