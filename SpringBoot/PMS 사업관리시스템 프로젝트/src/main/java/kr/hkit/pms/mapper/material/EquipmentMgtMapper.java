package kr.hkit.pms.mapper.material;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.hkit.pms.domain.material.EquipmentMgtDTO;

public interface EquipmentMgtMapper {

	
	//전체 리스트 가져오기 
	@Select("select * from tb_eqm order by idx")
	public List<EquipmentMgtDTO> getList();
}
