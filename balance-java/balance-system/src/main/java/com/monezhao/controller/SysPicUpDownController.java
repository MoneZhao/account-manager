package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiSupport;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysPicUpDown;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.service.SysPicUpDownService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

/**
 * 图片上传下载Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/picUpDown")
@Api(tags = "图片上传下载")
@ApiSupport(author = "monezhao@163.com")
@Slf4j
public class SysPicUpDownController extends BaseController {
    @Autowired
    private SysPicUpDownService sysPicUpDownService;

    /**
     * 自定义查询列表
     *
     * @param sysPicUpDown
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:picUpDown:list")
    @GetMapping(value = "/list")
    @ApiOperation("图片上传下载列表")
    public Result list(SysPicUpDown sysPicUpDown, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysPicUpDown> pageList = sysPicUpDownService.list(new Page<>(current, size), sysPicUpDown);
        return Result.ok(pageList);
    }

    @GetMapping(value = "/queryById")
    @ApiOperation("图片上传下载查询")
    public void queryById(@RequestParam String id, HttpServletResponse response) {
        SysPicUpDown sysPicUpDown = sysPicUpDownService.getById(id);
        if (sysPicUpDown == null) {
            throw new SysException("图片id不存在");
        }
        if (sysPicUpDown.getPicName().endsWith(".png")) {
            response.setContentType("image/png");
        } else {
            response.setContentType("image/jpeg");
        }
        response.setCharacterEncoding("utf-8");
        try (OutputStream outputStream = response.getOutputStream();
             InputStream in = new ByteArrayInputStream(sysPicUpDown.getPic())) {
            int len;
            byte[] buf = new byte[1024];
            while ((len = in.read(buf, 0, 1024)) != -1) {
                outputStream.write(buf, 0, len);
            }
        } catch (IOException e) {
            log.error("获取图片流失败", e);
        }
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @RequiresPermissions("sys:picUpDown:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("图片上传下载删除")
    @SysLogAuto(value = "图片上传下载删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysPicUpDownService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysPicUpDownService.removeById(idsArr[0]);
        }
        return Result.ok();
    }

    /**
     * @param file
     * @return
     * @功能：图片上传
     */
    @RequiresPermissions("sys:picUpDown:save")
    @PostMapping(value = "/uploadPic")
    @ApiOperation("图片上传")
    @SysLogAuto(value = "图片上传")
    public Result uploadPic(@RequestParam MultipartFile file) {
        sysPicUpDownService.upload(file);
        return Result.ok();
    }

}
