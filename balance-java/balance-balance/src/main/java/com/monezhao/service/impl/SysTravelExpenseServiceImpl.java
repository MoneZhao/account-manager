package com.monezhao.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.bean.sys.SysTravelExpense;
import com.monezhao.mapper.SysTravelExpenseMapper;
import com.monezhao.service.SysTravelExpenseService;

import java.util.List;

/**
 * 出差报销Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysTravelExpenseServiceImpl extends BaseServiceImpl<SysTravelExpenseMapper, SysTravelExpense>
        implements SysTravelExpenseService {
    @Override
    public IPage<SysTravelExpense> list(IPage<SysTravelExpense> page, SysTravelExpense sysTravelExpense) {
        List<SysTravelExpense> records = baseMapper.list(page, sysTravelExpense);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }
}
