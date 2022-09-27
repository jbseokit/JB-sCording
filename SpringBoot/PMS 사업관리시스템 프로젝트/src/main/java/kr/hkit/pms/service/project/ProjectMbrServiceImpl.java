package kr.hkit.pms.service.project;

import java.util.List;


import org.springframework.stereotype.Service;
import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectMbrDto;
import kr.hkit.pms.mapper.project.ProjectMbrMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ProjectMbrServiceImpl implements ProjectMbrService {
	
	//spring 4.3이상에서 자동처리
	private ProjectMbrMapper mapper;

	@Override
	public void register(ProjectMbrDto m_project) {
		log.info("register......" + m_project);
		mapper.insertSelectKey(m_project);
		
	}

	@Override
	public ProjectMbrDto get(Long idx) {
		log.info("get......" + idx);
		return mapper.read(idx) ;
	}

	@Override
	public boolean modify(ProjectMbrDto m_project) {
		log.info("modify......" + m_project);
		return mapper.update(m_project) == 1;
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
	public List<ProjectMbrDto> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
			
}
