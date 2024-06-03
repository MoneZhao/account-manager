package vip.xiaonuo.biz.modular.balancecount.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vip.xiaonuo.biz.modular.balancecount.entity.BizBalanceCount;
import vip.xiaonuo.biz.modular.balancecount.mapper.BizBalanceCountMapper;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountAddParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountEditParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountIdParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountPageParam;
import vip.xiaonuo.biz.modular.balancecount.service.BizBalanceCountService;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.page.CommonPageRequest;
import vip.xiaonuo.dev.api.DevDictApi;

import java.util.List;

/**
 * 计入总资产Service接口实现类
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
@Service
public class BizBalanceCountServiceImpl extends ServiceImpl<BizBalanceCountMapper, BizBalanceCount> implements BizBalanceCountService {

    @Autowired
    private DevDictApi devDictApi;

    @Override
    public Page<BizBalanceCount> page(BizBalanceCountPageParam bizBalanceCountPageParam) {
        String parentId = devDictApi.getIdByDictValue("BALANCE_TYPE");
        bizBalanceCountPageParam.setSearchKey(parentId);
        bizBalanceCountPageParam.setUserId(StpUtil.getLoginIdAsString());
        Page<BizBalanceCount> page = CommonPageRequest.defaultPage();
        return page.setRecords(baseMapper.list(page, bizBalanceCountPageParam));
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BizBalanceCountAddParam bizBalanceCountAddParam) {
        BizBalanceCount bizBalanceCount = BeanUtil.toBean(bizBalanceCountAddParam, BizBalanceCount.class);
        this.save(bizBalanceCount);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(BizBalanceCountEditParam bizBalanceCountEditParam) {
        BizBalanceCount bizBalanceCount = BeanUtil.toBean(bizBalanceCountEditParam, BizBalanceCount.class);
        if (bizBalanceCount.getId() == null) {
            bizBalanceCount.setUserId(StpUtil.getLoginIdAsString());
        }
        this.saveOrUpdate(bizBalanceCount);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<BizBalanceCountIdParam> bizBalanceCountIdParamList) {
        // 执行删除
        this.removeByIds(CollStreamUtil.toList(bizBalanceCountIdParamList, BizBalanceCountIdParam::getId));
    }

    @Override
    public BizBalanceCount detail(BizBalanceCountIdParam bizBalanceCountIdParam) {
        return this.queryEntity(bizBalanceCountIdParam.getId());
    }

    @Override
    public BizBalanceCount queryEntity(String id) {
        BizBalanceCount bizBalanceCount = this.getById(id);
        if(ObjectUtil.isEmpty(bizBalanceCount)) {
            throw new CommonException("计入总资产不存在，id值为：{}", id);
        }
        return bizBalanceCount;
    }
}
