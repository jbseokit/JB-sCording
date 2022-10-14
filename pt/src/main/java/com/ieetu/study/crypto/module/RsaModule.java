package com.ieetu.study.crypto.module;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ieetu.study.crypto.vo.RsaVo;

public class RsaModule {
    
    // 키 생성 실패 시 로그 기록
    private static final Logger LOGGER = LoggerFactory.getLogger(RsaModule.class);
    
    // 개인키 session key
    public static final String RSA_WEB_KEY = "_RSA_WEB_Key_"; 
    
    // RSA transformation
    public static final String RSA_INSTANCE = "RSA"; 
    
    // key 사이즈
    public static final int KEY_SIZE = 1024;
    
    
    private KeyPairGenerator generator;
    
    private KeyFactory keyFactory;
    
    private KeyPair keyPair;
    
    private Cipher cipher;

    public RsaModule() {
        
        try {
            
            generator = KeyPairGenerator.getInstance(RSA_INSTANCE);
            
            generator.initialize(KEY_SIZE);
            
            keyFactory = KeyFactory.getInstance(RSA_INSTANCE);
            
            cipher = Cipher.getInstance(RSA_INSTANCE);
            
        } catch (Exception e) {
            
            LOGGER.warn("RSA 키 생성 실패", e);
            
        }
  
    }
    
    // 새로운 키값을 가진 RSA 생성
    // @return vo.RsaVo
    public RsaVo createRsa() {
        
        RsaVo rsa = null;
        
        try {
            // 쌍으로 된 키 생성 및 공개, 개인키 생성
            keyPair = generator.generateKeyPair();
            
            PublicKey publicKey = keyPair.getPublic();
            
            PrivateKey privateKey = keyPair.getPrivate();
            
            RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            
            String modulus = publicSpec.getModulus().toString(16);
            
            String exponent = publicSpec.getPublicExponent().toString(16);
            
            rsa = new RsaVo(privateKey, modulus, exponent);
            
        } catch (Exception e) {
            
            LOGGER.warn("RsaModule.createRsa()", e);
            
        }

        return rsa;
        
    }
    
    // 개인키를 이용한 RSA 복호화
    // @param privateKey session에 저장된 PrivateKey
    // @param encryptedText 암호화된 문자열 
    public String getDecryptText(PrivateKey privateKey, String encryptedText) throws Exception {
        
        // cipher를 개인키를 갖고 복호화 모드로 초기화
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        
        byte[] decryptedBytes = cipher.doFinal(hexToByteArray(encryptedText));
        
        return new String(decryptedBytes, "UTF-8");
        
    }
    
    
    
}
