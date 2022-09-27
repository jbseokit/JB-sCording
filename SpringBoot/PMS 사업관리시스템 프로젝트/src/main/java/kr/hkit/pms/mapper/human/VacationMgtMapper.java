package kr.hkit.pms.mapper.human;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.human.VacationMgtDto;

@Mapper
public interface VacationMgtMapper {
	// R
	public List<VacationMgtDto> readList(Criteria cri);
	public VacationMgtDto read(String vac_sn);
	
	// C
	public void create(VacationMgtDto vacation); 
	
	// U
	public void update(VacationMgtDto vacation);
	
	// D
	public void delete();
}
