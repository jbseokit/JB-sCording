package kr.hkit.pms.service.project;

import java.util.List;


import org.springframework.stereotype.Service;
import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectScheDto;
import kr.hkit.pms.mapper.project.ProjectScheMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ProjectScheServiceImpl implements ProjectScheService {
	
	//spring 4.3이상에서 자동처리
	private ProjectScheMapper mapper;

	@Override
	public void register(ProjectScheDto s_project) {
		log.info("register......" + s_project);
		mapper.insertSelectKey(s_project);
		
	}

	@Override
	public ProjectScheDto get(Long idx) {
		log.info("get......" + idx);
		return mapper.read(idx) ;
	}

	@Override
	public boolean modify(ProjectScheDto s_project) {
		log.info("modify......" + s_project);
		return mapper.update(s_project) == 1;
	}

	@Override
	public boolean remove(Long idx) {
		log.info("remove...." + idx);
		return mapper.delete(idx) == 1 ;
	}

	/*
	 * @Override public List<ProjectInfoDto> getList() {
	 * log.info("getList.........."); return mapper.getList(); }
	 */
	
	@Override
	public List<ProjectScheDto> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
			
}
