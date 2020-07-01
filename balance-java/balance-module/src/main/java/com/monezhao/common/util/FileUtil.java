package com.monezhao.common.util;

import com.monezhao.common.exception.SysException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author monezhao@163.com
 * @date 2020/7/1 9:55 上午
 */
@Slf4j
public class FileUtil {

    /**
     * FileUtil.uploadFile()
     *
     * @Description: 上传文件到指定目录
     * @Date: [ 2020-07-01 09:56:40 ]
     * @author: monezhao@163.com
     * @param: [file, filePath]
     * @return: void
     * @Version: v1.0
     */
    public static void uploadFile(MultipartFile multipartFile, String filePath) {
        File file = new File(filePath + multipartFile.getOriginalFilename());
        File fileParent = file.getParentFile();
        if (!fileParent.exists()) {
            fileParent.mkdirs();
        }
        try (InputStream inputStream = multipartFile.getInputStream();
             OutputStream outputStream = new FileOutputStream(filePath + multipartFile.getOriginalFilename())) {
            byte[] bytes = new byte[1024];
            int length;
            while ((length = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, length);
            }
        } catch (IOException e) {
            log.error("写入文件失败", e);
            throw new SysException(e);
        }
    }

    /**
     * FileUtil.downloadFile()
     *
     * @Description: 返回文件的输入流
     * @Date: [ 2020-07-01 11:29:31 ]
     * @author: monezhao@163.com
     * @param: [fileName, filePath]
     * @return: java.io.InputStream
     * @Version: v1.0
     */
    public static InputStream downloadFile(String fileName, String filePath) {
        InputStream inputStream;
        File file = new File(filePath + File.separator + fileName);
        try {
            inputStream = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            log.error(filePath + File.separator + fileName + " 文件不存在", e);
            throw new SysException(filePath + File.separator + fileName + " 文件不存在");
        }
        return inputStream;
    }

}
