package kr.hkit.pms.mapper.human;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.human.HumanInfoMgtDto;

@Mapper
public interface HumanInfoMgtMapper {
	
	public List<HumanInfoMgtDto> selectInfo();
	
}
