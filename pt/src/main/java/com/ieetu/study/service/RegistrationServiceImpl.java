package com.ieetu.study.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.ieetu.study.domain.MemberDto;

import com.ieetu.study.mapper.RegistrationMapper;

@Service

public class RegistrationServiceImpl implements RegistrationService {
	
	@Autowired
	RegistrationMapper regMapper;
	
	@Override
	public void signUpMember(MemberDto mbr) {
		
		regMapper.insertMember(mbr);
		
	}

}
