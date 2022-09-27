package kr.hkit.pms.mapper.common;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.LoginDto;

@Mapper
public interface LoginMapper {
	public LoginDto read(String mbr_sn);
}
