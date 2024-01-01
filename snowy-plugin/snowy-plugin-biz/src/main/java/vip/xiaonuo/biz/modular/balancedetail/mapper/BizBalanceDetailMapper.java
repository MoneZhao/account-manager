package vip.xiaonuo.biz.modular.balancedetail.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailPageParam;

import java.math.BigDecimal;
import java.util.List;

/**
 * 账户明细Mapper接口
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
public interface BizBalanceDetailMapper extends BaseMapper<BizBalanceDetail> {

    Page<BizBalanceDetail> list(Page<BizBalanceDetail> page, @Param("entity") BizBalanceDetailPageParam bizBalanceDetailPageParam);

    BigDecimal account(@Param("id") String id, @Param("userId") String userId);

    /**
     * 还原用户删除列表
     */
    void restore(@Param("list") List<String> idsArr);

}
