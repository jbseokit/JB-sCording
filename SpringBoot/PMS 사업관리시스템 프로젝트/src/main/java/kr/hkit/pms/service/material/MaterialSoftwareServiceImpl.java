package kr.hkit.pms.service.material;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.material.SoftwareMgtDTO;
import kr.hkit.pms.mapper.material.SoftwareMgtMapper;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MaterialSoftwareServiceImpl implements MaterialSoftwareServive {
	// 임시로 생성한 클래스
	
	
	@Setter(onMethod_ = {@Autowired})
	private SoftwareMgtMapper mapper;
	
	
	  @Override
	  public List<SoftwareMgtDTO> getAll() { 
		  log.info("-------getList");
	  return mapper.getList(); 
	  }
}
