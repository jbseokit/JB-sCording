package kr.hkit.pms.mapper.human;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.human.AttendMgtDto;

@Mapper
public interface AttendanceMgtMapper {
	public List<AttendMgtDto> getList();
}
