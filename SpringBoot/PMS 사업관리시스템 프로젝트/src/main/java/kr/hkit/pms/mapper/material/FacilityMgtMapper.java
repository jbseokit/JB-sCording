package kr.hkit.pms.mapper.material;

import kr.hkit.pms.domain.material.FacilityMgtDTO;


public interface FacilityMgtMapper {

	//facility에 든 정보 db에 insert 
	public void insert(FacilityMgtDTO faciliy );
	
	
}
