package kr.hkit.pms.mapper.material;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.hkit.pms.domain.material.SoftwareMgtDTO;

@Mapper
public interface SoftwareMgtMapper {

	//전체 리스트 가져오기
	//@Select("select * from tb_sw where idx > 0")
	public List<SoftwareMgtDTO> getList();
	
}
