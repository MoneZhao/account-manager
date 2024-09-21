package vip.xiaonuo.biz.modular.balanceredpacket.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import vip.xiaonuo.biz.modular.balanceredpacket.entity.BizBalanceRedPacket;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketPageParam;
import java.util.List;

/**
 * 红包记账Mapper接口
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
public interface BizBalanceRedPacketMapper extends BaseMapper<BizBalanceRedPacket> {
    List<BizBalanceRedPacket> list(Page<BizBalanceRedPacket> page, @Param("entity") BizBalanceRedPacketPageParam entity);
}
