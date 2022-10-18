package com.ieetu.study.crypto.module;

import org.apache.commons.lang3.StringUtils;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class AesModule {
    
    // AES는 암호화 키의 길이와 무관하게 고정된 128비트(16바이트) 블록단위로 암호화 진행
    public static byte[] ivBytes = {48, 81, 80, 97, 71, 107, 80, 109, 80, 70, 55, 83, 97, 102, 76, 110};
    
    // 암호화 키 길이 32바이트로 암호화 수행
    public static String encrypt(String text, String key)
            throws Exception {

        if (StringUtils.isEmpty(text)) {
            
            return text;
        
        }

        String encrypted = null;
        
        byte[] source = text.getBytes("UTF-8");
        
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");

        AlgorithmParameterSpec IVspec = new IvParameterSpec(ivBytes);
        
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, IVspec);
        
        int mod = source.length % 16;
        
        if (mod != 0) {
            
            text = String.format(text + "%" + (16 - mod) + "s", " ");
        
        }

        encrypted = byteArrayToHex_256(cipher.doFinal(text.getBytes("UTF-8")));

        return encrypted;
    }
    
    // AES256 암호화
    private static String byteArrayToHex_256(byte buf[]) {
        StringBuffer strbuf = new StringBuffer();
        for (int i = 0; i < buf.length; i++) {
            strbuf.append(String.format("%02x", buf[i]));
        }

        return strbuf.toString();
    }
    
    // // 암호화 키 길이 32바이트로 복호화 수행
    public static String decrypt(String s, String key)
            throws Exception {
        
        if (s == null || s.length() == 0) {
            
            return s;
        
        }
        
        String decrypted = null;
        
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
        
        // AES 암호화, CBC 모드, 패딩 작업 X
        Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");

        AlgorithmParameterSpec IVspec = new IvParameterSpec(ivBytes);
        
        cipher.init(Cipher.DECRYPT_MODE, skeySpec, IVspec);
        
        decrypted = new String(cipher.doFinal(hexToByteArray_256(s)), "UTF-8");

        return decrypted.trim();
        
    }
    
    // AES256 복호화
    private static byte[] hexToByteArray_256(String s) {
        
        byte[] retValue = null;
        
        if (s != null && s.length() != 0) {
            
            retValue = new byte[s.length() / 2];
            
            for (int i = 0; i < retValue.length; i++) {
                
                retValue[i] = (byte) Integer.parseInt(s.substring(2 * i, 2 * i + 2), 16);
            
            }
        }
        
        return retValue;
    }
    

    
    
}
