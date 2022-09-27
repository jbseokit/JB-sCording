package kr.hkit.pms.service.common;

import java.util.List;

import kr.hkit.pms.domain.common.LoginDto;

public interface LoginService {
	
	// 로그인 테스트
	public LoginDto selectHrLogin(String mbr_sn);
}
