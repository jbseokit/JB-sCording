package com.ieetu.study.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ieetu.study.domain.MemberDto;

@Mapper

public interface RegistrationMapper {

	public void insertMember(MemberDto mbr);
	
	public int selectId(String id);
	
}
