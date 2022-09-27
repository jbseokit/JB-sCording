package kr.hkit.pms.service.material;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.SoftwareMgtDTO;
import kr.hkit.pms.mapper.material.SoftwareMgtMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MaterialSoftwareServiceImpl implements MaterialSoftwareService {
	
	//의존성 주입
	@Autowired
	private SoftwareMgtMapper mapper;

	
    @Override 
	public List<SoftwareMgtDTO> ListAll() {
	  log.info("ListAll................"); return mapper.swList(); 
	 }
	 
    @Override
	public List<SoftwareMgtDTO> getSoftwareListAll(Criteria cri) { 
		 log.info("-------getSoftwareListPaging"+cri);
		 return mapper.getListWithPaging(cri); 
	}
    @Override
	  public int getTotal(Criteria cri) {
		  log.info("-------------getTotalCount");
			
		  return mapper.getTotalCount(cri);
	  }
    
    @Override
    public List<SoftwareMgtDTO> comboListAll() {
    	log.info("comboListAll....................");
    	return mapper.comboList();
    }
    @Override
    public List<SoftwareMgtDTO> comboListPageAll(String sw_nm){
    	log.info("comboListPageAll................");
    	return mapper.comboListPage(sw_nm);
    }

	@Override
	public SoftwareMgtDTO ListGet(int idx) {
		log.info("ListGet-----" );
		return mapper.getList(idx);
	}

	@Override
	public void Register(SoftwareMgtDTO smd) {
		log.info("Register-----" + smd);
		mapper.insert(smd);
		
	}

	@Override
	public boolean Mdify(SoftwareMgtDTO smd) {
		log.info("Mdify-----" + smd );
		return mapper.update(smd)==1;
	}

	@Override
	public boolean Remove(int idx) {
		log.info("Remove-----" + idx );
		return mapper.delete(idx)==1;
	}
	
	
	  
}
