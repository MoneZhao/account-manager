package vip.xiaonuo.biz.modular.balanceredpacket.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.page.CommonPageRequest;
import vip.xiaonuo.biz.modular.balanceredpacket.entity.BizBalanceRedPacket;
import vip.xiaonuo.biz.modular.balanceredpacket.mapper.BizBalanceRedPacketMapper;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketAddParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketEditParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketIdParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketPageParam;
import vip.xiaonuo.biz.modular.balanceredpacket.service.BizBalanceRedPacketService;

import java.util.List;

/**
 * 红包记账Service接口实现类
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
@Service
public class BizBalanceRedPacketServiceImpl extends ServiceImpl<BizBalanceRedPacketMapper, BizBalanceRedPacket> implements BizBalanceRedPacketService {

    @Override
    public Page<BizBalanceRedPacket> page(BizBalanceRedPacketPageParam bizBalanceRedPacketPageParam) {
        Page<BizBalanceRedPacket> page = CommonPageRequest.defaultPage();
        return page.setRecords(baseMapper.list(page, bizBalanceRedPacketPageParam));
    }

    @Override
    public List<BizBalanceRedPacket> list(BizBalanceRedPacketPageParam bizBalanceRedPacketPageParam) {
        return baseMapper.list(null, bizBalanceRedPacketPageParam);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BizBalanceRedPacketAddParam bizBalanceRedPacketAddParam) {
        BizBalanceRedPacket bizBalanceRedPacket = BeanUtil.toBean(bizBalanceRedPacketAddParam, BizBalanceRedPacket.class);
        bizBalanceRedPacket.setUserId(StpUtil.getLoginIdAsString());
        this.save(bizBalanceRedPacket);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(BizBalanceRedPacketEditParam bizBalanceRedPacketEditParam) {
        BizBalanceRedPacket bizBalanceRedPacket = this.queryEntity(bizBalanceRedPacketEditParam.getId());
        BeanUtil.copyProperties(bizBalanceRedPacketEditParam, bizBalanceRedPacket);
        this.updateById(bizBalanceRedPacket);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<BizBalanceRedPacketIdParam> bizBalanceRedPacketIdParamList) {
        // 执行删除
        this.removeByIds(CollStreamUtil.toList(bizBalanceRedPacketIdParamList, BizBalanceRedPacketIdParam::getId));
    }

    @Override
    public BizBalanceRedPacket detail(BizBalanceRedPacketIdParam bizBalanceRedPacketIdParam) {
        return this.queryEntity(bizBalanceRedPacketIdParam.getId());
    }

    @Override
    public BizBalanceRedPacket queryEntity(String id) {
        BizBalanceRedPacket bizBalanceRedPacket = this.getById(id);
        if(ObjectUtil.isEmpty(bizBalanceRedPacket)) {
            throw new CommonException("红包记账不存在，id值为：{}", id);
        }
        return bizBalanceRedPacket;
    }
}
