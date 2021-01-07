package com.monezhao.service;

import com.monezhao.common.base.BaseService;
import com.monezhao.bean.sys.SysPicUpDown;
import org.springframework.web.multipart.MultipartFile;

/**
 * 图片上传下载Service
 *
 * @author monezhao@163.com
 */
public interface SysPicUpDownService extends BaseService<SysPicUpDown> {
    /**
     * 图片上传
     *
     * @param file file
     */
    String upload(MultipartFile file);
}
