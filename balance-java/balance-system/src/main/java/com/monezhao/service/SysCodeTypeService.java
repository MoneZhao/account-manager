package com.monezhao.service;

import com.monezhao.bean.sys.SysCodeType;
import com.monezhao.common.base.BaseService;

/**
 * 代码类别Service
 *
 * @author monezhao@163.com
 */
public interface SysCodeTypeService extends BaseService<SysCodeType> {

    /**
     * 删除数据字典信息
     *
     * @param ids
     */
    void deleteSysCodeType(String ids);

    /**
     * 刷新缓存数据
     */
    void flush();
}
