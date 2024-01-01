package vip.xiaonuo.biz.modular.balancemain.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainAddParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainEditParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainIdParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainPageParam;

import java.util.Date;
import java.util.List;

/**
 * 账户余额Service接口
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
public interface BizBalanceMainService extends IService<BizBalanceMain> {

    /**
     * 获取账户余额分页
     *
     * @author monezhao
     * @date  2023/12/25 16:56
     */
    Page<BizBalanceMain> page(BizBalanceMainPageParam bizBalanceMainPageParam);

    /**
     * 添加账户余额
     *
     * @author monezhao
     * @date  2023/12/25 16:56
     */
    void add(BizBalanceMainAddParam bizBalanceMainAddParam);

    /**
     * 编辑账户余额
     *
     * @author monezhao
     * @date  2023/12/25 16:56
     */
    void edit(BizBalanceMainEditParam bizBalanceMainEditParam);

    /**
     * 删除账户余额
     *
     * @author monezhao
     * @date  2023/12/25 16:56
     */
    void delete(List<BizBalanceMainIdParam> bizBalanceMainIdParamList);

    /**
     * 获取账户余额详情
     *
     * @author monezhao
     * @date  2023/12/25 16:56
     */
    BizBalanceMain detail(BizBalanceMainIdParam bizBalanceMainIdParam);

    /**
     * 获取账户余额详情
     *
     * @author monezhao
     * @date  2023/12/25 16:56
     **/
    BizBalanceMain queryEntity(String id);

    /**
     * 判断数据日期重复
     *
     * @param bizBalanceMain bizBalanceMain
     */
    boolean exist(BizBalanceMain bizBalanceMain);

    /**
     * 查询用户删除列表
     */
    void restore(@Param("list") List<String> idsArr);

    /**
     * 查询账户所有记录时间点
     * @return List<Date>
     */
    List<Date> rangDate();
}
