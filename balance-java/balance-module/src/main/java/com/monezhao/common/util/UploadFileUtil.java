package com.monezhao.common.util;

import com.monezhao.common.exception.SysException;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;

/**
 * @author: monezhao@163.com
 * @Date: 2020/5/30 10:09
 * @Description:
 */
public class UploadFileUtil {

    private static final String FILE_SPACE = System.getProperty("user.dir") + File.separator + "balance"
            + File.separator + "FileSpace" + File.separator;

    public static String savaFileByNio(FileInputStream fis, String fileName) {
        String path = FILE_SPACE + fileName;
        // 判断父文件夹是否存在
        File file = new File(path);
        if (file.getParentFile() != null || !file.getParentFile().isDirectory()) {
            file.getParentFile().mkdirs();
        }
        // 通过NIO保存文件到本地磁盘
        try {
            FileOutputStream fos = new FileOutputStream(path);
            FileChannel inChannel = fis.getChannel();
            FileChannel outChannel = fos.getChannel();
            inChannel.transferTo(0, inChannel.size(), outChannel);
            inChannel.close();
            outChannel.close();
        } catch (Exception e) {
            throw new SysException("保存文件失败", e);
        }
        return path;
    }

    public static String filePath() {
        return FILE_SPACE;
    }

}
