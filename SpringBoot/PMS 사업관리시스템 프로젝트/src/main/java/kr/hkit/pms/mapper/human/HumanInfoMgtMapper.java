package kr.hkit.pms.mapper.human;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.human.HumanInfoMgtDto;

@Mapper
public interface HumanInfoMgtMapper {
	// 페이징 적용
	public List<HumanInfoMgtDto> readList(Criteria cri);
	public HumanInfoMgtDto read(String mbr_sn);
	
	public void create(HumanInfoMgtDto human);
	
	public void update(HumanInfoMgtDto human);
	
	public void delete(String mbr_sn);
	public String deleteName(String mbr_sn);
	
}
