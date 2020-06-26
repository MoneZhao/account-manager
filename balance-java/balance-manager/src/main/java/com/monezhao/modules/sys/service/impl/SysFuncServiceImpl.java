package com.monezhao.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysFunc;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.modules.sys.mapper.SysFuncMapper;
import com.monezhao.modules.sys.service.SysFuncService;
import org.springframework.stereotype.Service;

/**
 * 功能Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysFuncServiceImpl extends BaseServiceImpl<SysFuncMapper, SysFunc> implements SysFuncService {
    @Override
    public IPage<SysFunc> list(IPage<SysFunc> page, SysFunc sysFunc) {
        return page.setRecords(baseMapper.list(page, sysFunc));
    }
}
