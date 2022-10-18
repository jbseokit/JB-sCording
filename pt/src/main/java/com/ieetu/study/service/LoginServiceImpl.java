package com.ieetu.study.service;


import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ieetu.study.crypto.module.ShaModule;
import com.ieetu.study.domain.MemberDto;

import com.ieetu.study.mapper.LoginMapper;

@Service

public class LoginServiceImpl implements LoginService {
    
    @Autowired
    LoginMapper loginmapper;
    
    @Override
    public List<MemberDto> selectMember() {
        
        return loginmapper.selectMember();
        
    }
    
	@Override
	public String authMemberName(MemberDto member) {
	    
		return loginmapper.authMemberName(member);
		
	}

	@Override
	public boolean authMember(MemberDto member) {
		
	    // RSA 복호화된 평문을 다시 SHA256으로 암호화 한 후 DB에 저장된 값과 비교
	    member.setMbrPw(ShaModule.encrypt(member.getMbrPw()));
	    
		return loginmapper.authMember(member);
		
	}
    
    
}
