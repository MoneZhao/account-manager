package vip.xiaonuo.biz.modular.travelexpense.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpensePageParam;

import java.util.List;

/**
 * 出差报销Mapper接口
 *
 * @author monezhao
 * @date  2023/12/23 19:25
 **/
public interface BizTravelExpenseMapper extends BaseMapper<BizTravelExpense> {
    /**
     * 查询出差报销列表
     *
     * @param page
     * @param entity
     * @return
     */
    List<BizTravelExpense> list(Page<BizTravelExpense> page, @Param("entity") BizTravelExpensePageParam entity);
}
