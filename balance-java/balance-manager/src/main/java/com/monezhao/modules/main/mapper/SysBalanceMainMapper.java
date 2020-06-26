package com.monezhao.modules.main.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysBalanceMain;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 账户余额主Mapper
 *
 * @author monezhao@163.com
 */
public interface SysBalanceMainMapper extends BaseMapper<SysBalanceMain> {
    /**
     * 查询账户余额主列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysBalanceMain> list(IPage<SysBalanceMain> page, @Param("entity") SysBalanceMain entity);

    /**
     * SysBalanceMainMapper.deleteMain()
     *
     * @Description: 删除主表
     * @Date: [ 2020-06-11 17:16:14 ]
     * @author: monezhao@163.com
     * @param list
     * @return: boolean
     * @Version: v1.0
     */
    public boolean deleteMain(List<String> list);

    /**
     * SysBalanceMainMapper.deleteDetail()
     *
     * @Description: 删除子表
     * @Date: [ 2020-06-11 17:16:14 ]
     * @author: monezhao@163.com
     * @param list
     * @return: boolean
     * @Version: v1.0
     */
    public boolean deleteDetail(List<String> list);
}
