package com.monezhao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.monezhao.CreateFirst;
import com.monezhao.annotation.SysLogAuto;
import com.monezhao.bean.sys.SysCodeCreate;
import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.FileUtil;
import com.monezhao.service.SysCodeCreateService;
import com.monezhao.util.CodeUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

/**
 * 代码在线生成Controller
 *
 * @author monezhao@163.com
 */
@RestController
@RequestMapping("/sys/codeCreate")
@Slf4j
@Api(tags = "代码在线生成")
public class SysCodeCreateController extends BaseController {

    @Autowired
    private SysCodeCreateService sysCodeCreateService;

    private static final String EXCEL_DESIGN_PATH = CodeUtil.projectPath + "db" + File.separator;

    /**
     * 自定义查询列表
     *
     * @param sysCodeCreate
     * @param current
     * @param size
     * @return
     */
    @RequiresPermissions("sys:codeCreate:list")
    @GetMapping(value = "/list")
    @ApiOperation("代码在线生成列表")
    public Result list(SysCodeCreate sysCodeCreate, @RequestParam Integer current, @RequestParam Integer size) {
        IPage<SysCodeCreate> pageList = sysCodeCreateService.list(new Page<>(current, size), sysCodeCreate);
        return Result.ok(pageList);
    }

    @RequiresPermissions("sys:codeCreate:list")
    @GetMapping(value = "/queryById")
    @ApiOperation("代码在线生成查询")
    public Result queryById(@RequestParam String id) {
        SysCodeCreate sysCodecreate = sysCodeCreateService.getById(id);
        return Result.ok(sysCodecreate);
    }

    /**
     * @param sysCodeCreate
     * @return
     * @功能：新增
     */
    @SysLogAuto(value = "新增代码生成")
    @RequiresPermissions("sys:codeCreate:save")
    @PostMapping(value = "/save")
    @ApiOperation("代码在线生成新增")
    @ApiOperationSupport(ignoreParameters = {
            "codeCreateId",
    })
    public Result save(@Valid @RequestBody SysCodeCreate sysCodeCreate) {
        CodeUtil.module = sysCodeCreate.getCodeCreateModule();
        CodeUtil.createTableName = sysCodeCreate.getCodeCreateTablename();
        CodeUtil.excelDesignPath = EXCEL_DESIGN_PATH + sysCodeCreate.getCodeCreateFilename();
        CreateFirst.main(null);
        sysCodeCreateService.save(sysCodeCreate);
        return Result.ok();
    }

    /**
     * @param sysCodeCreate
     * @return
     * @功能：修改
     */
    @SysLogAuto(value = "修改代码生成")
    @RequiresPermissions("sys:codeCreate:update")
    @PutMapping(value = "/update")
    @ApiOperation("代码在线生成修改")
    public Result update(@Valid @RequestBody SysCodeCreate sysCodeCreate) {
        sysCodeCreateService.updateById(sysCodeCreate);
        return Result.ok();
    }

    /**
     * @param ids
     * @return
     * @功能：批量删除
     */
    @SysLogAuto(value = "删除代码生成")
    @RequiresPermissions("sys:codeCreate:delete")
    @DeleteMapping(value = "/delete")
    @ApiOperation("代码在线生成删除")
    public Result delete(@RequestParam String ids) {
        if (ids == null || ids.trim().length() == 0) {
            return Result.error("ids can't be empty");
        }
        String[] idsArr = ids.split(",");
        if (idsArr.length > 1) {
            sysCodeCreateService.removeByIds(Arrays.asList(idsArr));
        } else {
            sysCodeCreateService.removeById(idsArr[0]);
        }
        return Result.ok();
    }

    /**
     * excel 文件上传
     *
     * @param filePath
     * @param request
     * @return
     */
    @SysLogAuto(value = "代码生成文件上传")
    @PostMapping(value = "/doImport")
    @ApiOperation("代码生成文件上传")
    public Result doImport(@RequestParam(required = false) String filePath, HttpServletRequest request) {
        if (!(request instanceof MultipartHttpServletRequest)) {
            throw new IllegalArgumentException("上传文件请求格式错误");
        }
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        if (multipartRequest.getFileMap().size() == 0) {
            throw new IllegalArgumentException("上传文件为空");
        }
        MultipartFile file = multipartRequest.getFileMap().values().iterator().next();
        String fileName = file.getOriginalFilename();
        if (null == filePath) {
            filePath = EXCEL_DESIGN_PATH;
        }
        FileUtil.uploadFile(file, filePath);
        return Result.ok(fileName);
    }

    /**
     * excel 文件下载
     *
     * @param sysCodeCreate
     * @param response
     * @return
     */
    @SysLogAuto(value = "代码生成文件下载")
    @GetMapping(value = "/doExport")
    @RequiresPermissions("sys:codeCreate:export")
    @ApiOperation("代码生成文件下载")
    @ApiOperationSupport(ignoreParameters = {
            "codeCreateId",
            "codeCreateModule",
            "codeCreateTablename",
    })
    public void doExport(SysCodeCreate sysCodeCreate, HttpServletResponse response) {
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-disposition", "attachment;filename=" + sysCodeCreate.getCodeCreateFilename());
        try (InputStream inputStream = FileUtil.downloadFile(sysCodeCreate.getCodeCreateFilename(), EXCEL_DESIGN_PATH);
             OutputStream outputStream = response.getOutputStream()) {
            byte[] bytes = new byte[1024];
            int length;
            while ((length = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, length);
            }
        } catch (IOException e) {
            log.error("读取文件失败", e);
            throw new SysException("读取文件失败");
        }

    }
}