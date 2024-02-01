package vip.xiaonuo.biz.modular.travelexpense.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollStreamUtil;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelReader;
import com.alibaba.excel.read.metadata.ReadSheet;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import vip.xiaonuo.auth.core.util.StpLoginUserUtil;
import vip.xiaonuo.biz.modular.travelexpense.entity.BizTravelExpense;
import vip.xiaonuo.biz.modular.travelexpense.excel.UploadBizTravelExpenseListener;
import vip.xiaonuo.biz.modular.travelexpense.mapper.BizTravelExpenseMapper;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseAddParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseEditParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpenseIdParam;
import vip.xiaonuo.biz.modular.travelexpense.param.BizTravelExpensePageParam;
import vip.xiaonuo.biz.modular.travelexpense.service.BizTravelExpenseService;
import vip.xiaonuo.common.exception.CommonException;
import vip.xiaonuo.common.page.CommonPageRequest;

import java.io.IOException;
import java.util.List;

/**
 * 出差报销Service接口实现类
 *
 * @author monezhao
 * @date 2023/12/23 19:25
 **/
@Service
public class BizTravelExpenseServiceImpl extends ServiceImpl<BizTravelExpenseMapper, BizTravelExpense> implements BizTravelExpenseService {

    @Autowired
    private DataSourceTransactionManager dataSourceTransactionManager;

    @Autowired
    private TransactionDefinition transactionDefinition;

    @Override
    public Page<BizTravelExpense> page(BizTravelExpensePageParam bizTravelExpensePageParam) {
        List<String> loginUserDataScope = StpLoginUserUtil.getLoginUserDataScope();
        if (ObjectUtil.isNotEmpty(loginUserDataScope)) {
            bizTravelExpensePageParam.setOrgIds(loginUserDataScope);
        } else {
            bizTravelExpensePageParam.setUserId(StpUtil.getLoginIdAsString());
        }
        Page<BizTravelExpense> page = CommonPageRequest.defaultPage();
        return page.setRecords(baseMapper.list(page, bizTravelExpensePageParam));
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void add(BizTravelExpenseAddParam bizTravelExpenseAddParam) {
        BizTravelExpense bizTravelExpense = BeanUtil.toBean(bizTravelExpenseAddParam, BizTravelExpense.class);
        if (exit(bizTravelExpense)) {
            throw new CommonException("当天报销已存在");
        }
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
        bizTravelExpense.setUserId(StpUtil.getLoginIdAsString());
        this.save(bizTravelExpense);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void edit(BizTravelExpenseEditParam bizTravelExpenseEditParam) {
        BizTravelExpense bizTravelExpense = this.queryEntity(bizTravelExpenseEditParam.getId());
        BeanUtil.copyProperties(bizTravelExpenseEditParam, bizTravelExpense);
        if (exit(bizTravelExpense)) {
            throw new CommonException("当天报销已存在");
        }
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

    @Override
    public void importManager(MultipartFile file) {
        try (ExcelReader excelReader = EasyExcel.read(file.getInputStream()).build()) {
            TransactionStatus transaction = dataSourceTransactionManager.getTransaction(transactionDefinition);
            ReadSheet readSheet = EasyExcel.readSheet(0).head(BizTravelExpense.class).
                    registerReadListener(
                            new UploadBizTravelExpenseListener(
                                    this,
                                    dataSourceTransactionManager,
                                    transaction
                            )
                    ).build();
            excelReader.read(readSheet);
            excelReader.finish();
        } catch (IOException e) {
            throw new CommonException("Excel文件无法读取");
        } catch (RuntimeException e) {
            throw new CommonException(e.getMessage());
        } catch (Exception e) {
            throw new CommonException("Excel文件读取错误: " + e.getMessage());
        }
    }

    public Boolean exit(BizTravelExpense bizTravelExpense) {
        QueryWrapper<BizTravelExpense> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(BizTravelExpense::getTravelPlace, bizTravelExpense.getTravelPlace())
                .eq(BizTravelExpense::getRequestDate, bizTravelExpense.getRequestDate())
                .eq(BizTravelExpense::getRequestNumber, bizTravelExpense.getRequestNumber())
        ;

        if (StrUtil.isNotBlank(bizTravelExpense.getId())) {
            //update
            queryWrapper.lambda().ne(BizTravelExpense::getId, bizTravelExpense.getId());
        }
        BizTravelExpense one = this.getOne(queryWrapper, false);
        return one != null;
    }

    @Override
    public void doImport(List<BizTravelExpense> list) {
        QueryWrapper<BizTravelExpense> queryWrapper;
        for (BizTravelExpense bizTravelExpense : list) {
            queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda()
                    .eq(BizTravelExpense::getTravelPlace, bizTravelExpense.getTravelPlace())
                    .eq(BizTravelExpense::getRequestDate, bizTravelExpense.getRequestDate())
                    .eq(BizTravelExpense::getRequestNumber, bizTravelExpense.getRequestNumber())
            ;
            this.remove(queryWrapper);

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
            bizTravelExpense.setUserId(StpUtil.getLoginIdAsString());
        }

        this.saveBatch(list);
    }
}
