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
	
	private KeyPairGenerator generator;
    
    private KeyFactory keyFactory;
    
    private KeyPair keyPair;
    
    private Cipher cipher;
	
    
    
    // RSA 모듈 생성자
    public RsaModule() {
        
        try {
            
            generator = KeyPairGenerator.getInstance("RSA");
            
            generator.initialize(1024);
            
            keyFactory = KeyFactory.getInstance("RSA");
            
            cipher = Cipher.getInstance("RSA");
            
        } catch (Exception e) {
            
            LOGGER.warn("RSA 키 생성 실패", e);
            
        }
  
    }
    
    // 공개키, 개인키 생성
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
    // @param privateKey : session에 저장된 PrivateKey
    // @param encryptedText 암호화된 문자열
    // @return 복호화된 문자열
    public String getDecryptText(PrivateKey privateKey, String encryptedText) throws Exception {
        
        // cipher를 개인키를 갖고 복호화 모드로 초기화
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        
        byte[] decryptedBytes = cipher.doFinal(hexToByteArray(encryptedText));
        
        return new String(decryptedBytes, "UTF-8");
        
    }
    
     // 16진수 문자열을 byte 배열로 변환한다.
     // @param hex
     // @return byte 타입의 배열
    public byte[] hexToByteArray(String hex) {
        
    	if (hex == null || hex.length() % 2 != 0) {
            
    		return new byte[]{};
        
    	}

        byte[] bytes = new byte[hex.length() / 2];
        
        for (int i = 0; i < hex.length(); i += 2) {
        	
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            
            bytes[(int) Math.floor(i / 2)] = value;
        }
        
        return bytes;
    }
    
    
}
