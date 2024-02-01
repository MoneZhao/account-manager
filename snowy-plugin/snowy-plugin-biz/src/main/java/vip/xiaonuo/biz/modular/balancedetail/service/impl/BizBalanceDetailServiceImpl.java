package vip.xiaonuo.biz.modular.balancedetail.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.util.ObjectUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.read.metadata.ReadSheet;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import vip.xiaonuo.biz.modular.balancedetail.entity.BizBalanceDetail;
import vip.xiaonuo.biz.modular.balancedetail.excel.UploadBizBalanceDetailListener;
import vip.xiaonuo.biz.modular.balancedetail.excel.UploadBizBalanceMainListener;
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
import vip.xiaonuo.dev.core.pojo.DevDictApiPojo;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 账户明细Service接口实现类
 *
 * @author monezhao
 * @date 2023/12/25 16:57
 **/
@Service
public class BizBalanceDetailServiceImpl extends ServiceImpl<BizBalanceDetailMapper, BizBalanceDetail> implements BizBalanceDetailService {

    @Autowired
    private BizBalanceMainService mainService;

    @Autowired
    private DevDictApi devDictApi;

    @Autowired
    private DataSourceTransactionManager dataSourceTransactionManager;

    @Autowired
    private TransactionDefinition transactionDefinition;

    @Override
    public Page<BizBalanceDetail> page(BizBalanceDetailPageParam bizBalanceDetailPageParam) {
        String parentId = devDictApi.getIdByDictValue("BALANCE_TYPE");
        bizBalanceDetailPageParam.setSearchKey(parentId);
        Page<BizBalanceDetail> page = CommonPageRequest.defaultPage();
        return page.setRecords(baseMapper.list(page, bizBalanceDetailPageParam));
    }

    @Override
    public List<BizBalanceDetail> list(BizBalanceDetailPageParam query) {
        String parentId = devDictApi.getIdByDictValue("BALANCE_TYPE");
        query.setSearchKey(parentId);
        return baseMapper.list(null, query);
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
        if (ObjectUtil.isEmpty(bizBalanceDetail)) {
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
            detail.setId(null);
            detail.setUserId(bizBalanceMain.getUserId());
        }
        this.saveBatch(details);

        this.fix(bizBalanceMain.getId());

        return true;
    }

    @Override
    public List<BizBalanceDetail> queryDetail(String userId, Date startMonth, Date endMonth, String balanceType) {
        String parentId = devDictApi.getIdByDictValue("BALANCE_TYPE");
        return baseMapper.queryDetail(userId, startMonth, endMonth, balanceType, parentId);
    }

    @Override
    public void importManager(MultipartFile file) {
        try (ExcelReader excelReader = EasyExcel.read(file.getInputStream()).build()) {
            TransactionStatus transaction = dataSourceTransactionManager.getTransaction(transactionDefinition);
            ReadSheet readSheet1 = EasyExcel.readSheet(0).head(BizBalanceMain.class).
                    registerReadListener(
                            new UploadBizBalanceMainListener(
                                    mainService,
                                    dataSourceTransactionManager,
                                    transaction
                            )
                    ).build();
            ReadSheet readSheet2 = EasyExcel.readSheet(1).head(BizBalanceDetail.class).
                    registerReadListener(
                            new UploadBizBalanceDetailListener(
                                    this,
                                    dataSourceTransactionManager,
                                    transaction
                            )
                    ).build();
            excelReader.read(readSheet1, readSheet2);
            excelReader.finish();
        } catch (IOException e) {
            throw new CommonException("Excel文件无法读取");
        } catch (RuntimeException e) {
            throw new CommonException(e.getMessage());
        } catch (Exception e) {
            throw new CommonException("Excel文件读取错误: " + e.getMessage());
        }
    }

    @Override
    public boolean doImport(List<BizBalanceDetail> list) {
        String userId = StpUtil.getLoginIdAsString();
        String parentId = devDictApi.getIdByDictValue("BALANCE_TYPE");
        Map<String, List<DevDictApiPojo>> stringListMap = devDictApi.getListByParentId(parentId)
                .stream()
                .collect(Collectors.groupingBy(DevDictApiPojo::getDictLabel));
        List<String> unknownDict = new ArrayList<>();
        for (BizBalanceDetail bizBalanceDetail : list) {
            String balanceName = bizBalanceDetail.getBalanceName();
            if (!stringListMap.containsKey(balanceName)) {
                unknownDict.add(balanceName);
            } else {
                bizBalanceDetail.setBalanceType(stringListMap.get(balanceName).get(0).getDictValue());
            }
        }
        if (!unknownDict.isEmpty()) {
            StringJoiner joiner = new StringJoiner(", ", "[", "]");
            for (String dict : unknownDict) {
                joiner.add(dict);
            }
            throw new RuntimeException("账户类型不存在: " + joiner);
        }

        Set<Date> dateSet = list.stream().map(BizBalanceDetail::getAccountDate).collect(Collectors.toSet());
        QueryWrapper<BizBalanceMain> mainQueryWrapper = new QueryWrapper<>();
        mainQueryWrapper.lambda()
                .eq(BizBalanceMain::getUserId, userId)
                .in(BizBalanceMain::getAccountDate, dateSet);
        List<BizBalanceMain> balanceMains = mainService.list(mainQueryWrapper);

        Map<Date, List<BizBalanceMain>> mainListMap = balanceMains.stream()
                .collect(Collectors.groupingBy(BizBalanceMain::getAccountDate));
        Map<Date, List<BizBalanceDetail>> detailListMap = list.stream()
                .collect(Collectors.groupingBy(BizBalanceDetail::getAccountDate));

        for (Map.Entry<Date, List<BizBalanceDetail>> entry : detailListMap.entrySet()) {
            Date k = entry.getKey();
            List<BizBalanceDetail> v = entry.getValue();

            if (mainListMap.containsKey(k) && !mainListMap.get(k).isEmpty()) {
                String mainId = mainListMap.get(k).get(0).getId();
                BizBalanceDetailPageParam query = new BizBalanceDetailPageParam();
                query.setBalanceMainId(mainId);
                List<BizBalanceDetail> records = this.list(query);
                Map<String, List<BizBalanceDetail>> recordListMap = records.stream()
                        .collect(Collectors.groupingBy(BizBalanceDetail::getBalanceType));

                List<BizBalanceDetail> adds = new ArrayList<>();
                List<BizBalanceDetail> updates = new ArrayList<>();
                for (BizBalanceDetail detail : v) {
                    if (recordListMap.containsKey(detail.getBalanceType())) {
                        BizBalanceDetail balanceDetail = recordListMap.get(detail.getBalanceType()).get(0);
                        balanceDetail.setAccount(detail.getAccount());
                        balanceDetail.setRemark(detail.getRemark() == null ? "" : detail.getRemark());
                        updates.add(balanceDetail);
                    } else {
                        detail.setBalanceMainId(mainId);
                        detail.setUserId(userId);
                        adds.add(detail);
                    }
                }
                this.saveBatch(adds);
                this.updateBatchById(updates);

                BizBalanceMain sysBalanceMain = mainService.getById(mainId);
                BigDecimal account = baseMapper.account(mainId, sysBalanceMain.getUserId());
                sysBalanceMain.setAccount(account == null ? BigDecimal.valueOf(0) : account);
                mainService.updateById(sysBalanceMain);
            } else {
                //不存在当前日期数据
                BizBalanceMain main = new BizBalanceMain();
                main.setAccountDate(k);
                main.setUserId(userId);
                main.setAccount(new BigDecimal(0));
                mainService.save(main);

                for (BizBalanceDetail detail : v) {
                    detail.setBalanceMainId(main.getId());
                    detail.setUserId(userId);
                }
                this.saveBatch(v);

                BigDecimal account = baseMapper.account(main.getId(), userId);
                main.setAccount(account == null ? BigDecimal.valueOf(0) : account);
                mainService.updateById(main);
            }
        }

        return true;
    }
}
