package vip.xiaonuo.biz.modular.balancecount.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import vip.xiaonuo.biz.modular.balancecount.entity.BizBalanceCount;
import vip.xiaonuo.biz.modular.balancecount.param.BizBalanceCountPageParam;

/**
 * 计入总资产Mapper接口
 *
 * @author monezhao
 * @date  2023/12/23 21:12
 **/
public interface BizBalanceCountMapper extends BaseMapper<BizBalanceCount> {

    Page<BizBalanceCount> list(Page<Object> objectPage,@Param("entity")  BizBalanceCountPageParam bizBalanceCountPageParam);

}
