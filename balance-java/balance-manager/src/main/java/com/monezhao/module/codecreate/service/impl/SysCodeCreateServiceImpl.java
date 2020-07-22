package com.monezhao.module.codecreate.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeCreate;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.module.codecreate.mapper.SysCodeCreateMapper;
import com.monezhao.module.codecreate.service.SysCodeCreateService;
import org.springframework.stereotype.Service;

/**
 * 代码在线生成Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysCodeCreateServiceImpl extends BaseServiceImpl<SysCodeCreateMapper, SysCodeCreate>
        implements SysCodeCreateService {
    @Override
    public IPage<SysCodeCreate> list(IPage<SysCodeCreate> page, SysCodeCreate sysCodeCreate) {
        return page.setRecords(baseMapper.list(page, sysCodeCreate));
    }
}
