package vip.xiaonuo.biz.modular.balancedetail.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailAddParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailEditParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailIdParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailPageParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainAddParam;

import java.util.List;

/**
 * 账户明细Service接口
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
public interface BizBalanceDetailService extends IService<BizBalanceDetail> {

    /**
     * 获取账户明细分页
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    Page<BizBalanceDetail> page(BizBalanceDetailPageParam bizBalanceDetailPageParam);

    /**
     * 添加账户明细
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    void add(BizBalanceDetailAddParam bizBalanceDetailAddParam);

    /**
     * 编辑账户明细
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    void edit(BizBalanceDetailEditParam bizBalanceDetailEditParam);

    /**
     * 删除账户明细
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    void delete(List<BizBalanceDetailIdParam> bizBalanceDetailIdParamList);

    /**
     * 获取账户明细详情
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     */
    BizBalanceDetail detail(BizBalanceDetailIdParam bizBalanceDetailIdParam);

    /**
     * 获取账户明细详情
     *
     * @author monezhao
     * @date  2023/12/25 16:57
     **/
    BizBalanceDetail queryEntity(String id);

    /**
     * 更新账户余额
     * @param mainId id
     */
    void fix(String mainId);

    /**
     * 更新全部账户余额
     */
    void fixBatch();

    void restoreMain(List<String> list);

    /**
     * 删除账户余额
     *
     * @param idsArr
     * @return
     */
    boolean deleteMain(List<String> idsArr);

    /**
     * 账户余额复制
     * @param bizBalanceMain bizBalanceMain
     */
    boolean copy(BizBalanceMainAddParam bizBalanceMainAddParam);
}
