package kr.hkit.pms.service.material;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.EquipmentMgtDTO;
import kr.hkit.pms.mapper.material.EquipmentMgtMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
@Log4j2
@Service
@AllArgsConstructor
public class MaterialMgtServiceimpl implements MaterialMgtService {
	
	//의존성 주입
	@Autowired
	private EquipmentMgtMapper mapper;
	
	@Override
	public List<EquipmentMgtDTO> ListAll() {
		log.info("ListAll................");
		return mapper.equipList();
	}
	
	@Override
	public List<EquipmentMgtDTO> getEquipmentListAll(Criteria cri) { 
		 log.info("-------getEquipmentListPaging"+cri);
		 return mapper.getListWithPaging(cri); 
	}
	  
	@Override
	public int getTotal(Criteria cri) {
		 log.info("-------------getTotalCount");
			
		 return mapper.getTotalCount(cri);
	}

	@Override
	public List<EquipmentMgtDTO> comboListAll() {
		log.info("comboListAll................");
		return mapper.comboList();
	}
	
	@Override
	public List<EquipmentMgtDTO> comboListPageAll(String eqm_nm) {
		log.info("comboListPageAll................");
		return mapper.comboListPage(eqm_nm);
	}
	
	@Override
	public EquipmentMgtDTO ListGet(int idx) {
		log.info("ListGet-----" );
		return mapper.getList(idx);
	}
	
	@Override
	public void Register(EquipmentMgtDTO emd) {
		log.info("Register-----" + emd);
		mapper.insert(emd);
	}

	@Override
	public boolean Mdify(EquipmentMgtDTO emd) {
		log.info("Mdify-----" + emd );
		return mapper.update(emd)==1;
	}

	@Override
	public boolean Remove(int idx) {
		log.info("Remove-----" + idx );
		return mapper.delete(idx)==1;
	}
	
	

}
