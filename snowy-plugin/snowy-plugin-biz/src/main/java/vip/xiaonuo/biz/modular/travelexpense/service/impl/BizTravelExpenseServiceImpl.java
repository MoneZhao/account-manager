package vip.xiaonuo.biz.modular.travelexpense.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.mapper.BizTravelExpenseMapper;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseAddParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseEditParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseIdParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpensePageParam;
import vip.xiaonuo.biz.modular.travelexpense.service.BizTravelExpenseService;
import vip.xiaonuo.common.enums.CommonSortOrderEnum;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.page.CommonPageRequest;

import java.util.List;

/**
 * 出差报销Service接口实现类
 *
 * @author monezhao
 * @date 2023/12/23 19:25
 **/
@Service
public class BizTravelExpenseServiceImpl extends ServiceImpl<BizTravelExpenseMapper, BizTravelExpense> implements BizTravelExpenseService {

    @Override
    public Page<BizTravelExpense> page(BizTravelExpensePageParam bizTravelExpensePageParam) {
        QueryWrapper<BizTravelExpense> queryWrapper = new QueryWrapper<>();
        if (ObjectUtil.isNotEmpty(bizTravelExpensePageParam.getTravelPlace())) {
            queryWrapper.lambda().like(BizTravelExpense::getTravelPlace, bizTravelExpensePageParam.getTravelPlace());
        }
        if (ObjectUtil.isAllNotEmpty(bizTravelExpensePageParam.getSortField(), bizTravelExpensePageParam.getSortOrder())) {
            CommonSortOrderEnum.validate(bizTravelExpensePageParam.getSortOrder());
            queryWrapper.orderBy(true, bizTravelExpensePageParam.getSortOrder().equals(CommonSortOrderEnum.ASC.getValue()),
                    StrUtil.toUnderlineCase(bizTravelExpensePageParam.getSortField()));
        } else {
            queryWrapper.lambda()
                    .orderByDesc(BizTravelExpense::getRequestDate)
                    .orderByDesc(BizTravelExpense::getGetDate);
        }
        return this.page(CommonPageRequest.defaultPage(), queryWrapper);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BizTravelExpenseAddParam bizTravelExpenseAddParam) {
        BizTravelExpense bizTravelExpense = BeanUtil.toBean(bizTravelExpenseAddParam, BizTravelExpense.class);
        if (bizTravelExpense.getGetDate() != null) {
            bizTravelExpense.setUseDay(
                    (int) DateUtil.between(
                            bizTravelExpense.getRequestDate(),
                            bizTravelExpense.getGetDate(),
                            DateUnit.DAY
                    )
            );
        }
        if (bizTravelExpense.getGetNumber() != null) {
            bizTravelExpense.setAddNumber(
                    bizTravelExpense.getGetNumber().subtract(
                            bizTravelExpense.getUseNumber()
                    ).abs()
            );
        }
        this.save(bizTravelExpense);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(BizTravelExpenseEditParam bizTravelExpenseEditParam) {
        BizTravelExpense bizTravelExpense = this.queryEntity(bizTravelExpenseEditParam.getId());
        BeanUtil.copyProperties(bizTravelExpenseEditParam, bizTravelExpense);
        if (bizTravelExpense.getGetDate() != null) {
            bizTravelExpense.setUseDay(
                    (int) DateUtil.between(
                            bizTravelExpense.getRequestDate(),
                            bizTravelExpense.getGetDate(),
                            DateUnit.DAY
                    )
            );
        }
        if (bizTravelExpense.getGetNumber() != null) {
            bizTravelExpense.setAddNumber(
                    bizTravelExpense.getGetNumber().subtract(
                            bizTravelExpense.getUseNumber()
                    ).abs()
            );
        }
        this.updateById(bizTravelExpense);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<BizTravelExpenseIdParam> bizTravelExpenseIdParamList) {
        // 执行删除
        this.removeByIds(CollStreamUtil.toList(bizTravelExpenseIdParamList, BizTravelExpenseIdParam::getId));
    }

    @Override
    public BizTravelExpense detail(BizTravelExpenseIdParam bizTravelExpenseIdParam) {
        return this.queryEntity(bizTravelExpenseIdParam.getId());
    }

    @Override
    public BizTravelExpense queryEntity(String id) {
        BizTravelExpense bizTravelExpense = this.getById(id);
        if (ObjectUtil.isEmpty(bizTravelExpense)) {
            throw new CommonException("出差报销不存在，id值为：{}", id);
        }
        return bizTravelExpense;
    }
}
