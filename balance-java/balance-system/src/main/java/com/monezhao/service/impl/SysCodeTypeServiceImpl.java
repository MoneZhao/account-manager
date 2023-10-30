package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysCodeInfo;
import com.monezhao.bean.sys.SysCodeType;
import com.monezhao.common.Constants;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.RedisUtil;
import com.monezhao.mapper.SysCodeTypeMapper;
import com.monezhao.service.SysCodeInfoService;
import com.monezhao.service.SysCodeTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;

/**
 * 代码类别Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysCodeTypeServiceImpl extends BaseServiceImpl<SysCodeTypeMapper, SysCodeType>
        implements SysCodeTypeService {

    @Autowired
    private SysCodeInfoService sysCodeInfoService;

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public IPage<SysCodeType> list(IPage<SysCodeType> page, SysCodeType sysCodeType) {
        return page.setRecords(baseMapper.list(page, sysCodeType));
    }

    /**
     * 删除数据字典信息
     *
     * @param ids
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteSysCodeType(String ids) {
        if (ids == null || ids.trim().length() == 0) {
            throw new SysException("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            removeByIds(Arrays.asList(idsArr));
        } else {
            removeById(idsArr[0]);
        }
        sysCodeInfoService.remove(new QueryWrapper<SysCodeInfo>().in("code_type_id", (Object[]) idsArr));
        for (String codeTypeId : idsArr) {
            redisUtil.del(Constants.PREFIX_SYS_CODE_TYPE + codeTypeId);
        }
    }

    @Override
    public void flush() {
        sysCodeInfoService.loadSysCodeInfoToRedis(null);
    }
}
