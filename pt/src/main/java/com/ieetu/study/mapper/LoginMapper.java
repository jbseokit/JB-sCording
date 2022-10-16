package com.ieetu.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ieetu.study.domain.MemberDto;

@Mapper

public interface LoginMapper {
    
    public List<MemberDto> selectMember();
    
    public String authMemberName(MemberDto member);
    
    public boolean authMember(MemberDto member);
    
    
    
}
