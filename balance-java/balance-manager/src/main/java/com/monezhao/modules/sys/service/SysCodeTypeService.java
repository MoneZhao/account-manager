package com.monezhao.modules.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeType;
import com.monezhao.common.base.BaseService;

/**
 * 代码类别Service
 *
 * @author monezhao@163.com
 */
public interface SysCodeTypeService extends BaseService<SysCodeType> {

    /**
     * 分页查询代码类别
     *
     * @param page
     * @param sysCodeType
     * @return
     */
    IPage<SysCodeType> list(IPage<SysCodeType> page, SysCodeType sysCodeType);

    /**
     * 删除数据字典信息
     *
     * @param ids
     */
    void deleteSysCodeType(String ids);
}
