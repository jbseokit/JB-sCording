package kr.hkit.pms.mapper.human;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.human.AttendMgtDto;

@Mapper
public interface AttendanceMgtMapper {
	// R
	public List<AttendMgtDto> readList(Criteria cri);
	public AttendMgtDto read(String atd_sn);
	
	// C
	public void create(AttendMgtDto attend);
	
	// U
	public void update(String atd_sn);
	
	// D
	public void delete();
}
