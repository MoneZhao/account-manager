package com.monezhao.common.base;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:59
 * @Description:
 */
public interface BaseService<T> extends IService<T> {
    /**
     * 分页查询
     *
     * @param page page
     * @param t t
     * @return IPage
     */
    IPage<T> list(IPage<T> page, T t);
}
