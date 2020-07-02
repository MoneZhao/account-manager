package com.monezhao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monezhao.bean.sys.SysJobLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 定时任务执行日志Mapper
 *
 * @author monezhao@163.com
 */
public interface SysJobLogMapper extends BaseMapper<SysJobLog> {
    /**
     * 查询定时任务执行日志列表
     *
     * @param page
     * @param entity
     * @return
     */
    public List<SysJobLog> list(IPage<SysJobLog> page, @Param("entity") SysJobLog entity);
}
