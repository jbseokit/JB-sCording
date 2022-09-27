package kr.hkit.pms.service.material;

import java.util.List;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.SoftwareMgtDTO;

public interface MaterialSoftwareService {
	
	//전체 목록
	public List<SoftwareMgtDTO> ListAll();
	
	public SoftwareMgtDTO ListGet(int idx); //C
	public void Register(SoftwareMgtDTO smd); //R
	public boolean Mdify(SoftwareMgtDTO smd);  //U
	public boolean Remove(int idx);  //D
	//페이징 처리 
	public List<SoftwareMgtDTO> getSoftwareListAll(Criteria cri);
	public int getTotal(Criteria cri);
	//이름별 목록 출력
	public List<SoftwareMgtDTO> comboListAll();
	public List<SoftwareMgtDTO> comboListPageAll(String sw_nm);

}
