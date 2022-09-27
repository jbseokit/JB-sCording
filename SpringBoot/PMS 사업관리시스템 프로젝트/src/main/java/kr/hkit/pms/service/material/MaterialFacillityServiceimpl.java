package kr.hkit.pms.service.material;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.FacilityMgtDTO;
import kr.hkit.pms.mapper.material.FacilityMgtMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
@Log4j2
@Service
@AllArgsConstructor
public class MaterialFacillityServiceimpl implements MaterialFacillityService {
	
	//의존성 주입 
	@Autowired
	private FacilityMgtMapper mapper;
	
	
	@Override
	public List<FacilityMgtDTO> ListAll() {
		log.info("ListAll................");
		return mapper.fctList();
	}

	@Override
	public List<FacilityMgtDTO> getFacilityListAll(Criteria cri) { 
	    log.info("-------getFacilityListPaging"+cri);
		return mapper.getListWithPaging(cri); 
	}
	 
	@Override
	public int getTotal(Criteria cri) {
		 log.info("-------------getTotalCount");
			
		 return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<FacilityMgtDTO> comboListAll() {
		log.info("comboListAll................");
		return mapper.comboList();
	}
	
	@Override
	public List<FacilityMgtDTO> comboListPageAll(String fct_nm) {
		log.info("comboListPageAll................");
		return mapper.comboListPage(fct_nm);
	}
	
	@Override
	public FacilityMgtDTO ListGet(int idx) {
		log.info("ListGet-----" );
		return mapper.getList(idx);
	}

	@Override
	public void Register(FacilityMgtDTO fmd) {
		log.info("Register-----" + fmd);
		mapper.insert(fmd);

	}

	@Override
	public boolean Mdify(FacilityMgtDTO fmd) {
		log.info("Mdify-----" + fmd );
		return mapper.update(fmd)==1;
	}

	@Override
	public boolean Remove(int idx) {
		log.info("Remove-----" + idx );
		return mapper.delete(idx)==1;
	}

}
