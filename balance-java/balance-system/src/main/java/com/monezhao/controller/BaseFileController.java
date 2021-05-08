package com.monezhao.controller;

import com.monezhao.common.Result;
import com.monezhao.common.base.BaseController;
import com.monezhao.common.exception.SysException;
import com.monezhao.common.util.UploadFileUtil;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * @author monezhao@163.com
 * @date 2021/5/7 下午 05:21
 */
@RestController
@RequestMapping("/base/file")
public class BaseFileController extends BaseController {

    @PostMapping(value = "/upload")
    public Result uploadFile(@RequestParam("files") MultipartFile[] files) throws IOException {
        List<String> list = new ArrayList<>(files.length);
        // 1. 用数组MultipartFile[]来表示多文件,所以遍历数组,对其中的文件进行逐一操作
        for (MultipartFile file : files) {
            // 2. 通过一顿file.getXXX()的操作,获取文件信息。
            // 2.1 这里用文件名举个栗子
            String filename = file.getOriginalFilename() + "." + System.currentTimeMillis();
            list.add(filename);
            // 3. 接下来调用方法来保存文件到本地磁盘,返回的是保存后的文件路径
            UploadFileUtil.savaFileByNio((FileInputStream) file.getInputStream(), filename);
            // 4. 保存文件信息到数据库
        }
        return Result.ok(list);
    }

    @GetMapping(value = "/download/{fileName}")
    public ResponseEntity<ByteArrayResource> downloadFile(@PathVariable("fileName") String fileName, HttpServletRequest request) throws Exception {
        String originalFileName = fileName.substring(0, fileName.lastIndexOf('.'));
        String filePath = UploadFileUtil.filePath() + fileName;
        fileName = originalFileName;
        Path path = Paths.get(filePath);
        if (!path.toFile().exists()) {
            throw new SysException("文件不存在");
        }

        // 解决下载的文件的文件名出现中文乱码
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
            // IE浏览器
            fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
        } else {
            // 非IE浏览器
            fileName = new String(fileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
        }

        // 下载文件
        byte[] data = Files.readAllBytes(path);
        ByteArrayResource resource = new ByteArrayResource(data);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + fileName)
                .contentType(MediaType.APPLICATION_OCTET_STREAM).contentLength(data.length)
                .body(resource);
    }

}
