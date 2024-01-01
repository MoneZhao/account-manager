package vip.xiaonuo.biz.modular.balancecount.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import vip.xiaonuo.biz.modular.balancecount.entity.BizBalanceCount;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountAddParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountEditParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountIdParam;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountPageParam;

import java.util.List;

/**
 * 计入总资产Service接口
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
public interface BizBalanceCountService extends IService<BizBalanceCount> {

    /**
     * 获取计入总资产分页
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    Page<BizBalanceCount> page(BizBalanceCountPageParam bizBalanceCountPageParam);

    /**
     * 添加计入总资产
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    void add(BizBalanceCountAddParam bizBalanceCountAddParam);

    /**
     * 编辑计入总资产
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    void edit(BizBalanceCountEditParam bizBalanceCountEditParam);

    /**
     * 删除计入总资产
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    void delete(List<BizBalanceCountIdParam> bizBalanceCountIdParamList);

    /**
     * 获取计入总资产详情
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     */
    BizBalanceCount detail(BizBalanceCountIdParam bizBalanceCountIdParam);

    /**
     * 获取计入总资产详情
     *
     * @author monezhao
     * @date  2023/12/23 21:12
     **/
    BizBalanceCount queryEntity(String id);
}
