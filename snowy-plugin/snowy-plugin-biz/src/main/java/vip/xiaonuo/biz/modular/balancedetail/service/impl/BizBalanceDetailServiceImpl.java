package vip.xiaonuo.biz.modular.balancedetail.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.mapper.BizBalanceDetailMapper;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailAddParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailEditParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailIdParam;
import vip.xiaonuo.biz.modular.balancedetail.param.BizBalanceDetailPageParam;
import vip.xiaonuo.biz.modular.balancedetail.service.BizBalanceDetailService;
import vip.xiaonuo.biz.modular.balancemain.entity.BizBalanceMain;
import vip.xiaonuo.biz.modular.balancemain.param.BizBalanceMainAddParam;
import vip.xiaonuo.biz.modular.balancemain.service.BizBalanceMainService;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.page.CommonPageRequest;
import vip.xiaonuo.dev.api.DevDictApi;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 账户明细Service接口实现类
 *
 * @author monezhao
 * @date  2023/12/25 16:57
 **/
@Service
public class BizBalanceDetailServiceImpl extends ServiceImpl<BizBalanceDetailMapper, BizBalanceDetail> implements BizBalanceDetailService {

    @Autowired
    private BizBalanceMainService mainService;

    @Autowired
    private DevDictApi devDictApi;

    @Override
    public Page<BizBalanceDetail> page(BizBalanceDetailPageParam bizBalanceDetailPageParam) {
        String parentId = devDictApi.getIdByDictValue("BALANCE_TYPE");
        bizBalanceDetailPageParam.setSearchKey(parentId);
        bizBalanceDetailPageParam.setUserId(StpUtil.getLoginIdAsString());
        return baseMapper.list(CommonPageRequest.defaultPage(), bizBalanceDetailPageParam);
    }

    public boolean exist(BizBalanceDetail bizBalanceDetail) {
        QueryWrapper<BizBalanceDetail> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(BizBalanceDetail::getUserId, StpUtil.getLoginIdAsString())
                .eq(BizBalanceDetail::getBalanceMainId, bizBalanceDetail.getBalanceMainId())
                .eq(BizBalanceDetail::getBalanceType, bizBalanceDetail.getBalanceType());
        if (StringUtils.isNotEmpty(bizBalanceDetail.getId())) {
            queryWrapper.lambda()
                    .ne(BizBalanceDetail::getId, bizBalanceDetail.getId());
        }
        List<BizBalanceDetail> list = this.list(queryWrapper);
        return list != null && !list.isEmpty();
    }
    
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BizBalanceDetailAddParam bizBalanceDetailAddParam) {
        BizBalanceDetail bizBalanceDetail = BeanUtil.toBean(bizBalanceDetailAddParam, BizBalanceDetail.class);
        bizBalanceDetail.setUserId(StpUtil.getLoginIdAsString());
        if (exist(bizBalanceDetail)) {
            throw new CommonException("已存在此类型数据");
        }
        this.save(bizBalanceDetail);

        this.fix(bizBalanceDetail.getBalanceMainId());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(BizBalanceDetailEditParam bizBalanceDetailEditParam) {
        BizBalanceDetail bizBalanceDetail = this.queryEntity(bizBalanceDetailEditParam.getId());
        BeanUtil.copyProperties(bizBalanceDetailEditParam, bizBalanceDetail);
        if (exist(bizBalanceDetail)) {
            throw new CommonException("已存在此类型数据");
        }
        this.updateById(bizBalanceDetail);

        this.fix(bizBalanceDetail.getBalanceMainId());
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void delete(List<BizBalanceDetailIdParam> bizBalanceDetailIdParamList) {
        // 执行删除
        List<String> ids = CollStreamUtil.toList(bizBalanceDetailIdParamList, BizBalanceDetailIdParam::getId);
        BizBalanceDetail detail = this.getById(ids.get(0));
        this.removeByIds(ids);

        this.fix(detail.getBalanceMainId());
    }

    @Override
    public BizBalanceDetail detail(BizBalanceDetailIdParam bizBalanceDetailIdParam) {
        return this.queryEntity(bizBalanceDetailIdParam.getId());
    }

    @Override
    public BizBalanceDetail queryEntity(String id) {
        BizBalanceDetail bizBalanceDetail = this.getById(id);
        if(ObjectUtil.isEmpty(bizBalanceDetail)) {
            throw new CommonException("账户明细不存在，id值为：{}", id);
        }
        return bizBalanceDetail;
    }

    @Override
    public void fix(String mainId) {
        BigDecimal account = baseMapper.account(mainId, StpUtil.getLoginIdAsString());
        BizBalanceMain main = new BizBalanceMain();
        main.setId(mainId);
        main.setAccount(account == null ? BigDecimal.valueOf(0) : account);
        mainService.updateById(main);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void fixBatch() {
        QueryWrapper<BizBalanceMain> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(BizBalanceMain::getUserId, StpUtil.getLoginIdAsString());
        List<BizBalanceMain> list = mainService.list(queryWrapper);
        for (BizBalanceMain bizBalanceMain : list) {
            this.fix(bizBalanceMain.getId());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void restoreMain(List<String> idsArr) {
        baseMapper.restore(idsArr);
        mainService.restore(idsArr);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteMain(List<String> idsArr) {
        QueryWrapper<BizBalanceDetail> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .in(BizBalanceDetail::getBalanceMainId, idsArr);
        List<String> ids = this.list(queryWrapper).stream()
                .map(BizBalanceDetail::getId)
                .collect(Collectors.toList());
        if (ids.size() > 1) {
            super.removeByIds(ids);
        } else if (ids.size() == 1) {
            super.removeById(ids.get(0));
        }
        if (idsArr.size() > 1) {
            mainService.removeByIds(idsArr);
        } else {
            mainService.removeById(idsArr.get(0));
        }
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean copy(BizBalanceMainAddParam bizBalanceMainAddParam) {
        BizBalanceMain bizBalanceMain = BeanUtil.toBean(bizBalanceMainAddParam, BizBalanceMain.class);
        bizBalanceMain.setUserId(StpUtil.getLoginIdAsString());
        if (!mainService.exist(bizBalanceMain)) {
            mainService.save(bizBalanceMain);
        } else {
            throw new CommonException("已存在当日数据");
        }

        List<BizBalanceDetail> details = bizBalanceMainAddParam.getDetails();
        if (details == null || details.isEmpty()) {
            return true;
        }
        
        for (BizBalanceDetail detail : details) {
            detail.setBalanceMainId(bizBalanceMain.getId());
            detail.setUserId(bizBalanceMain.getUserId());
        }
        this.saveBatch(details);

        this.fix(bizBalanceMain.getId());

        return true;
    }
}
