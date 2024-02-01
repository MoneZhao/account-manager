package vip.xiaonuo.biz.modular.balancemain.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainPageParam;

import java.util.Date;
import java.util.List;

/**
 * 账户余额Mapper接口
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
public interface BizBalanceMainMapper extends BaseMapper<BizBalanceMain> {

    /**
     * 查询账户余额列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<BizBalanceMain> list(Page<BizBalanceMain> page, @Param("entity") BizBalanceMainPageParam entity);

    /**
     * 根据id物理删除账户余额
     *
     * @param mainIds
     * @return
     */
    boolean deleteMainIds(@Param("list") List<String> mainIds);

    /**
     * 查询用户删除列表
     */
    void restore(List<String> idsArr);

    List<Date> listAllDate(@Param("id") String id, @Param("orgIds") List<String> orgIds);

}
