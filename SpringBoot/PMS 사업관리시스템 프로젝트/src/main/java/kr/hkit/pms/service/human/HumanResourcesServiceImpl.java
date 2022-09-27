package kr.hkit.pms.service.human;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.human.AttendMgtDto;
import kr.hkit.pms.domain.human.HumanInfoMgtDto;
import kr.hkit.pms.domain.human.VacationMgtDto;
import kr.hkit.pms.mapper.human.AttendanceMgtMapper;
import kr.hkit.pms.mapper.human.HumanInfoMgtMapper;
import kr.hkit.pms.mapper.human.VacationMgtMapper;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class HumanResourcesServiceImpl implements HumanResourcesService {
	
	@Autowired
	HumanInfoMgtMapper hmm; 
	
	@Autowired
	AttendanceMgtMapper admm; 
	
	@Autowired
	VacationMgtMapper vmm;
	
	// -----------------------------hr Service-----------------------------
	
	// R
	@Override
	public List<HumanInfoMgtDto> selectHrList(Criteria cri) {
		return hmm.readList(cri);
	}
	
	@Override
	public HumanInfoMgtDto selectHr(String mbr_sn) {
		log.info("-----hr select serivce");
		return hmm.read(mbr_sn);
	}
	
	// C
	@Override
	public void registerHr(HumanInfoMgtDto human) {
		log.info("-----hr 등록 서비스");
		hmm.create(human);
	}
	
	
	// U
	@Override
	public void modifyHr(HumanInfoMgtDto human) {
		log.info("-----hr 수정 서비스");
		hmm.update(human);
	}
	
	// D
	@Override
	public String removeHr(String mbr_sn) {
		log.info("-----hr 삭제 서비스");
		hmm.delete(mbr_sn);
		log.info("삭제 되었는가? : " + hmm.deleteName(mbr_sn));
		return hmm.deleteName(mbr_sn);
	}
	
	
	// -----------------------------at service-----------------------------
	
	// R
	@Override
	public List<AttendMgtDto> selectAtList(Criteria cri) {
		return admm.readList(cri);
	}
	
	@Override
	public AttendMgtDto selectAt(String atd_sn) {
		return admm.read(atd_sn);
	}
	
	
	// C
	@Override
	public void registerAt(AttendMgtDto attend) {
		log.info("-----at 등록 서비스");
		admm.create(attend);
		
	}
	
	// U
	@Override
	public void modifyAt(String atd_sn) {
		admm.update(atd_sn);
		
	}
	
	// -----------------------------va service-----------------------------
	

	// R
	@Override
	public List<VacationMgtDto> selectVaList(Criteria cri) {
		return vmm.readList(cri);
	}
	

	@Override
	public VacationMgtDto selectVa(String vac_sn) {
		return vmm.read(vac_sn);
	}
	
	// C
	@Override
	public void registerVa(VacationMgtDto vacation) {
		log.info("-----va 등록 서비스");
		vmm.create(vacation);
		
	}
	
	// U
	@Override
	public void modifyVa(VacationMgtDto vacation) {
		vmm.update(vacation);
		
	}
	
}
