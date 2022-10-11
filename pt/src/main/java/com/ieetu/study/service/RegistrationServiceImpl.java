package com.ieetu.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ieetu.study.domain.MemberDto;
import com.ieetu.study.mapper.RegistrationMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RegistrationServiceImpl implements RegistrationService {
	
	@Autowired
	RegistrationMapper regMapper;
	
	@Override
	public void registMember(MemberDto mbr) {
		
		regMapper.insertMember(mbr);
		log.info("-----매퍼 완료");
		
	}

}
