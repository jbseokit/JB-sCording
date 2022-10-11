package com.ieetu.study.service;

import java.util.List;

import com.ieetu.study.domain.MemberDto;

public interface LoginService {
    
    public List<MemberDto> selectMember();
    
    public void registMember(MemberDto mbr);
    
}
