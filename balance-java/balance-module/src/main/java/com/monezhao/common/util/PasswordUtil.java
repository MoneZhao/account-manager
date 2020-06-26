package com.monezhao.common.util;

import org.apache.shiro.crypto.hash.Sha256Hash;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;


/**
 * @author monezhao@163.com
 * @Date: 2020/5/23 9:53
 * @Description: 密码加密
 */
public class PasswordUtil {

    /**
     * 定义加密次数
     */
    private static final int HASH_ITERATIONS = 1000;

    public static String encrypt(String password, String salt) {
        return new Sha256Hash(password, salt, HASH_ITERATIONS).toHex();
    }

    public static String randomGen(int place) {
        String base = "jhgfdsazxcvbnmqwertyuioplkEDCRFVTGBYHNUJMIKLOPQAZWSX0123456789";
        StringBuilder sb = new StringBuilder();
        SecureRandom random = new SecureRandom();
        for (int i = 0; i < place; i++) {
            sb.append(base.charAt(random.nextInt(base.length())));
        }
        return sb.toString();
    }

    /**
     * md5 工具类
     *
     * @param inStr 待md5字符串
     * @return md5 之后的字符串
     * @throws NoSuchAlgorithmException Exception
     */
    public static String md5Encode(String inStr) {
        MessageDigest md5;
        StringBuilder hexValue = new StringBuilder();
        try {
            md5 = MessageDigest.getInstance("MD5");
            byte[] byteArray = inStr.getBytes(StandardCharsets.UTF_8);
            byte[] md5Bytes = md5.digest(byteArray);
            for (byte md5Byte : md5Bytes) {
                int val = ((int) md5Byte) & 0xff;
                if (val < 16) {
                    hexValue.append("0");
                }
                hexValue.append(Integer.toHexString(val));
            }
        } catch (NoSuchAlgorithmException ignored) {
        }
        return hexValue.toString();
    }
}
