package kr.hkit.pms.service.material;

import java.util.List;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.EquipmentMgtDTO;

public interface MaterialMgtService {
	
	public List<EquipmentMgtDTO> ListAll();
	public EquipmentMgtDTO ListGet(int idx);
	
	public void Register(EquipmentMgtDTO emd);
	public boolean Mdify(EquipmentMgtDTO edm);
	public boolean Remove(int idx);
	
	public List<EquipmentMgtDTO> getEquipmentListAll(Criteria cri);
	public int getTotal(Criteria cri);
	
	public List<EquipmentMgtDTO> comboListAll();
	public List<EquipmentMgtDTO> comboListPageAll(String eqm_nm);
}
