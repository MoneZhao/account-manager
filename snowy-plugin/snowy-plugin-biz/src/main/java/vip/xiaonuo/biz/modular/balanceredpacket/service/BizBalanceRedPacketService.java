package vip.xiaonuo.biz.modular.balanceredpacket.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import vip.xiaonuo.biz.modular.balanceredpacket.entity.BizBalanceRedPacket;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketAddParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketEditParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketIdParam;
import vip.xiaonuo.biz.modular.balanceredpacket.param.BizBalanceRedPacketPageParam;

import java.util.List;

/**
 * 红包记账Service接口
 *
 * @author monezhao
 * @date  2024/06/21 16:24
 **/
public interface BizBalanceRedPacketService extends IService<BizBalanceRedPacket> {

    /**
     * 获取红包记账分页
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    Page<BizBalanceRedPacket> page(BizBalanceRedPacketPageParam bizBalanceRedPacketPageParam);

    /**
     * 获取红包记账 List
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    List<BizBalanceRedPacket> list(BizBalanceRedPacketPageParam bizBalanceRedPacketPageParam);

    /**
     * 添加红包记账
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    void add(BizBalanceRedPacketAddParam bizBalanceRedPacketAddParam);

    /**
     * 编辑红包记账
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    void edit(BizBalanceRedPacketEditParam bizBalanceRedPacketEditParam);

    /**
     * 删除红包记账
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    void delete(List<BizBalanceRedPacketIdParam> bizBalanceRedPacketIdParamList);

    /**
     * 获取红包记账详情
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     */
    BizBalanceRedPacket detail(BizBalanceRedPacketIdParam bizBalanceRedPacketIdParam);

    /**
     * 获取红包记账详情
     *
     * @author monezhao
     * @date  2024/06/21 16:24
     **/
    BizBalanceRedPacket queryEntity(String id);
}
