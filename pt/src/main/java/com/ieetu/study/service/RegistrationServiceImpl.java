package com.ieetu.study.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ieetu.study.crypto.module.AesModule;
import com.ieetu.study.crypto.module.ShaModule;
import com.ieetu.study.domain.MemberDto;

import com.ieetu.study.mapper.RegistrationMapper;

@Service

public class RegistrationServiceImpl implements RegistrationService {
	
    private static final String AES_KEY = "ieetuBlockchain1";
    
	@Autowired
	RegistrationMapper regMapper;
	
	@Override
	public void signUpMember(MemberDto mbr) {
		
	    try {
        // 전화번호 및 이메일 주소 AES 암호화
        mbr.setMbrPhone(AesModule.encrypt(mbr.getMbrPhone(), AES_KEY));
        
        mbr.setMbrEm(AesModule.encrypt(mbr.getMbrEm(), AES_KEY));
        
        // 비밀번호 SHA256 암호화
        mbr.setMbrPw(ShaModule.encrypt(mbr.getMbrPw()));
	    
        regMapper.insertMember(mbr);
        
	    } catch (Exception e) {
	        
	        e.printStackTrace();
	    
	    }
	}

    @Override
    public int checkid(String id) {
        
        return regMapper.selectId(id);
        
    }
	
	

}
