package kr.hkit.pms.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.LoginDto;
import kr.hkit.pms.domain.human.HumanInfoMgtDto;
import kr.hkit.pms.mapper.common.LoginMapper;

@Service
public class LoginSeriveImpl implements LoginService {
	
	@Autowired
	LoginMapper lm;
	
	@Override
	public LoginDto selectHrLogin(String mbr_sn) {
		return lm.read(mbr_sn);
	}

	
}
