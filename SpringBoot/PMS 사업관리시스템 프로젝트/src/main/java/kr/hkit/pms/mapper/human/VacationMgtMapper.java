package kr.hkit.pms.mapper.human;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.human.VacationMgtDto;

@Mapper
public interface VacationMgtMapper {
	public List<VacationMgtDto> getList();
}
