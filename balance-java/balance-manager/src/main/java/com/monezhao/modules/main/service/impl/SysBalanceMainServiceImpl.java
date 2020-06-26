package com.monezhao.modules.main.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceMain;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.modules.main.mapper.SysBalanceMainMapper;
import com.monezhao.modules.main.service.SysBalanceMainService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 账户余额主Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysBalanceMainServiceImpl extends BaseServiceImpl<SysBalanceMainMapper, SysBalanceMain>
        implements SysBalanceMainService {
    @Override
    public IPage<SysBalanceMain> list(IPage<SysBalanceMain> page, SysBalanceMain sysBalanceMain) {
        return page.setRecords(baseMapper.list(page, sysBalanceMain));
    }

    @Override
    @Transactional
    public boolean delete(List<String> ids) {
        baseMapper.deleteDetail(ids);
        baseMapper.deleteMain(ids);
        return true;
    }
}
