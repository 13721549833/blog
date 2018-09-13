package com.itaka.blog.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;

/**
 * 
 * ClassName: AESCryPTUtil <br/> 
 * Function: AES加密、解密工具类 <br/> 
 * date: 2018年6月20日 下午7:39:43 <br/> 
 * 
 * @author Jerry
 * @version
 */
public class AESCryPTUtil {

	/**
     * 实例化类型
     */
    private static final String AESTYPE = "AES/ECB/PKCS5Padding";

    /**
     * 
     * AES_Encrypt: AES加密 <br/>
     *
     * @author Jerry
     * @param keyStr 秘钥
     * @param plainText 要加密的字符串
     * @return
     */
    public static String aesEncrypt(String keyStr, String plainText) {
    	String str = null;
        byte[] encrypt = null;
        try {

            Key key = generateKey(keyStr);
            Cipher cipher = Cipher.getInstance(AESTYPE);
            cipher.init(Cipher.ENCRYPT_MODE, key);
            encrypt = cipher.doFinal(plainText.getBytes());
            str = new String(Base64.encodeBase64(encrypt));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    /**
     * 
     * AES_Decrypt: AES解密 <br/>
     *
     * @author Jerry
     * @param keyStr 秘钥
     * @param encryptData 要解密的字符串
     * @return
     */
    public static String aesDecrypt(String keyStr, String encryptData) {
    	String str = null;
        byte[] decrypt = null;
        try {
            Key key = generateKey(keyStr);
            Cipher cipher = Cipher.getInstance(AESTYPE);
            cipher.init(Cipher.DECRYPT_MODE, key);
            decrypt = cipher.doFinal(Base64.decodeBase64(encryptData));
            str = new String(decrypt).trim();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return str;
    }

    private static Key generateKey(String key) throws Exception {
        try {
            SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
            return keySpec;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public static void main(String[] args) {
        String keyStr = "wwwitakatop/blog";
        String plainText = "123456";
        // 加密
        String encText = aesEncrypt(keyStr, plainText);
        System.out.println("======================加密后：" + encText);
        // 解密
        String decString = aesDecrypt(keyStr, encText);
        System.out.println("======================解密后：" + decString);
    }
}
