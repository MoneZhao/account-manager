package com.monezhao.service;

import com.monezhao.bean.sys.SysLog;
import com.monezhao.common.base.BaseService;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;


/**
 * 系统日志Service
 *
 * @author monezhao@163.com
 */
public interface SysLogService extends BaseService<SysLog> {
    /**
     * 日志文件上传
     *
     * @param file file
     * @throws IOException exception
     */
    void importManager(MultipartFile file) throws IOException;
    /**
     * 导入日志
     *
     * @param list list
     * @return void
     */
    void doImport(List<SysLog> list);
}
