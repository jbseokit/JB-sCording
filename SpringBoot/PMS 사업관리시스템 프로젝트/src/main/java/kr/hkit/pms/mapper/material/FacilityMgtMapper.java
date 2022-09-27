package kr.hkit.pms.mapper.material;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.FacilityMgtDTO;

@Mapper
public interface FacilityMgtMapper {

	//전체 리스트 
	public List<FacilityMgtDTO> fctList();
	//페이징 처리
	public List<FacilityMgtDTO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public void insert(FacilityMgtDTO fmd); //C
	public FacilityMgtDTO getList(int idx);  //R
	public int update(FacilityMgtDTO fmd);  //U
	public int delete(int idx);  //D
	
	//이름별 목록 콤보박스
	public List<FacilityMgtDTO> comboList();
	public List<FacilityMgtDTO> comboListPage(String fct_nm);
	
	
}
