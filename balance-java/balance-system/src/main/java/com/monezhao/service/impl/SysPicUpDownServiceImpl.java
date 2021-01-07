package com.monezhao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monezhao.bean.sys.SysPicUpDown;
import com.monezhao.common.base.BaseServiceImpl;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.DateUtil;
import com.monezhao.common.util.PasswordUtil;
import com.monezhao.common.util.ShiroUtils;
import com.monezhao.mapper.SysPicUpDownMapper;
import com.monezhao.service.SysPicUpDownService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * 图片上传下载Service
 *
 * @author monezhao@163.com
 */
@Service
public class SysPicUpDownServiceImpl extends BaseServiceImpl<SysPicUpDownMapper, SysPicUpDown>
        implements SysPicUpDownService {
    @Override
    public IPage<SysPicUpDown> list(IPage<SysPicUpDown> page, SysPicUpDown sysPicUpDown) {
        List<SysPicUpDown> records = baseMapper.list(page, sysPicUpDown);
        if (page == null) {
            page = new Page<>();
            page.setTotal(records != null ? records.size() : 0L);
        }
        return page.setRecords(records);
    }

    @Override
    public String upload(MultipartFile file) {
        String userName = ShiroUtils.getSysUser().getUserName();
        String fileName = file.getOriginalFilename();
        String dateTime = DateUtil.dateToStr(DateUtil.getNow(), DateUtil.DATETIME_FORMAT_NOT_ALL);
        SysPicUpDown sysPicUpDown = new SysPicUpDown();
        sysPicUpDown.setPicName(userName + dateTime + fileName);
        try {
            byte[] pic = file.getBytes();
            sysPicUpDown.setPic(pic);
            sysPicUpDown.setMd5(PasswordUtil.md5Encode(pic));
            this.save(sysPicUpDown);
            return sysPicUpDown.getPicUpDownId();
        } catch (IOException e) {
            throw new SysException("获取图片流错误", e);
        }
    }
}
