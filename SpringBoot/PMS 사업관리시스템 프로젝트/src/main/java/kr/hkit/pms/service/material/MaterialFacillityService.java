package kr.hkit.pms.service.material;

import java.util.List;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.FacilityMgtDTO;


public interface MaterialFacillityService {

	//전체 목록
	public List<FacilityMgtDTO> ListAll();
	
	public FacilityMgtDTO ListGet(int idx); //C
	public void Register(FacilityMgtDTO fmd); //R
	public boolean Mdify(FacilityMgtDTO fdm); //U
	public boolean Remove(int idx); //D
	
	//페이징처리 
	public List<FacilityMgtDTO> getFacilityListAll(Criteria cri);
	public int getTotal(Criteria cri);
	//이름별 목록 콤보박스
	public List<FacilityMgtDTO> comboListAll();
	public List<FacilityMgtDTO> comboListPageAll(String fct_nm);
}
