package kr.hkit.pms.mapper.material;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.EquipmentMgtDTO;

@Mapper
public interface EquipmentMgtMapper {
	
	//전체 리스트 
	public List<EquipmentMgtDTO> equipList();
	
	//페이징 처리
	public List<EquipmentMgtDTO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public void insert(EquipmentMgtDTO emd); //C
	public EquipmentMgtDTO getList(int idx); //R
	public int update(EquipmentMgtDTO emd);  //U
	public int delete(int idx);  //D
	
	//이름별 목록 콤보박스
	public List<EquipmentMgtDTO> comboList();
	public List<EquipmentMgtDTO> comboListPage(String eqm_nm);
	
}


