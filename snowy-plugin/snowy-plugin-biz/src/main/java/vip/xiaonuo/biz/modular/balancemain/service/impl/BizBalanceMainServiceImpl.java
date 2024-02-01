package vip.xiaonuo.biz.modular.balancemain.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vip.xiaonuo.auth.core.util.StpLoginUserUtil;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.mapper.BizBalanceMainMapper;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainAddParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainEditParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainIdParam;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainPageParam;
import vip.xiaonuo.biz.modular.balancemain.service.BizBalanceMainService;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.page.CommonPageRequest;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 账户余额Service接口实现类
 *
 * @author monezhao
 * @date  2023/12/25 16:56
 **/
@Service
@Slf4j
public class BizBalanceMainServiceImpl extends ServiceImpl<BizBalanceMainMapper, BizBalanceMain> implements BizBalanceMainService {

    @Override
    public Page<BizBalanceMain> page(BizBalanceMainPageParam bizBalanceMainPageParam) {
        List<String> loginUserDataScope = StpLoginUserUtil.getLoginUserDataScope();
        if (ObjectUtil.isNotEmpty(loginUserDataScope)) {
            bizBalanceMainPageParam.setOrgIds(loginUserDataScope);
        } else {
            bizBalanceMainPageParam.setUserId(StpUtil.getLoginIdAsString());
        }

        Page<BizBalanceMain> page = CommonPageRequest.defaultPage();
        return page.setRecords(baseMapper.list(page, bizBalanceMainPageParam));
    }

    @Override
    public List<BizBalanceMain> list(BizBalanceMainPageParam query) {
        List<String> loginUserDataScope = StpLoginUserUtil.getLoginUserDataScope();
        if (ObjectUtil.isNotEmpty(loginUserDataScope)) {
            query.setOrgIds(loginUserDataScope);
        } else {
            query.setUserId(StpUtil.getLoginIdAsString());
        }
        return baseMapper.list(null, query);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BizBalanceMainAddParam bizBalanceMainAddParam) {
        BizBalanceMain bizBalanceMain = BeanUtil.toBean(bizBalanceMainAddParam, BizBalanceMain.class);
        bizBalanceMain.setUserId(StpUtil.getLoginIdAsString());
        if (!this.exist(bizBalanceMain)) {
            this.save(bizBalanceMain);
        } else {
            throw new CommonException("已存在当日数据");
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(BizBalanceMainEditParam bizBalanceMainEditParam) {
        BizBalanceMain bizBalanceMain = this.queryEntity(bizBalanceMainEditParam.getId());
        BeanUtil.copyProperties(bizBalanceMainEditParam, bizBalanceMain);
        bizBalanceMain.setUserId(StpUtil.getLoginIdAsString());
        if (!this.exist(bizBalanceMain)) {
            this.updateById(bizBalanceMain);
        } else {
            throw new CommonException("已存在当日数据");
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<BizBalanceMainIdParam> bizBalanceMainIdParamList) {
        // 执行删除
        this.removeByIds(CollStreamUtil.toList(bizBalanceMainIdParamList, BizBalanceMainIdParam::getId));
    }

    @Override
    public BizBalanceMain detail(BizBalanceMainIdParam bizBalanceMainIdParam) {
        return this.queryEntity(bizBalanceMainIdParam.getId());
    }

    @Override
    public BizBalanceMain queryEntity(String id) {
        BizBalanceMain bizBalanceMain = this.getById(id);
        if(ObjectUtil.isEmpty(bizBalanceMain)) {
            throw new CommonException("账户余额不存在，id值为：{}", id);
        }
        return bizBalanceMain;
    }

    @Override
    public boolean exist(BizBalanceMain bizBalanceMain) {
        QueryWrapper<BizBalanceMain> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(BizBalanceMain::getUserId, bizBalanceMain.getUserId())
                .eq(BizBalanceMain::getAccountDate, bizBalanceMain.getAccountDate());
        if (StringUtils.isNotEmpty(bizBalanceMain.getId())) {
            queryWrapper.lambda()
                    .ne(BizBalanceMain::getId, bizBalanceMain.getId());
        }
        List<BizBalanceMain> list = this.list(queryWrapper);
        return list != null && !list.isEmpty();
    }

    @Override
    public void restore(List<String> idsArr) {
        baseMapper.restore(idsArr);
    }

    @Override
    public List<Date> rangDate() {
        List<String> loginUserDataScope = StpLoginUserUtil.getLoginUserDataScope();
        if (ObjectUtil.isEmpty(loginUserDataScope)) {
            loginUserDataScope = null;
        }
        return baseMapper.listAllDate(StpUtil.getLoginIdAsString(), loginUserDataScope);
    }

    @Override
    public boolean doImport(List<BizBalanceMain> list) {
        String userId = StpUtil.getLoginIdAsString();
        List<Date> dates = list.stream().map(BizBalanceMain::getAccountDate).collect(Collectors.toList());
        
        QueryWrapper<BizBalanceMain> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(BizBalanceMain::getUserId, userId)
                .in(BizBalanceMain::getAccountDate, dates);

        List<BizBalanceMain> mains = this.list(queryWrapper);
        Map<Date, BizBalanceMain> balanceMainMap = mains.stream()
                .collect(Collectors.toMap(BizBalanceMain::getAccountDate, e -> e));

        for (BizBalanceMain bizBalanceMain : list) {
            bizBalanceMain.setUserId(userId);
            if (balanceMainMap.containsKey(bizBalanceMain.getAccountDate())) {
                bizBalanceMain.setId(balanceMainMap.get(bizBalanceMain.getAccountDate()).getId());
            }
        }
        return this.saveOrUpdateBatch(list);
    }
}
