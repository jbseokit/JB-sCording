package kr.hkit.pms.service.project;

import java.util.List;


import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectInfoDto;
import kr.hkit.pms.mapper.project.ProjectInfoMapper;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@AllArgsConstructor
public class ProjectServiceImpl implements ProjectService {
	
	//spring 4.3이상에서 자동처리
	private ProjectInfoMapper mapper;

	@Override
	public void register(ProjectInfoDto project) {
		log.info("register......" + project);
		mapper.insertSelectKey(project);
		
	}

	@Override
	public ProjectInfoDto get(Long idx) {
		log.info("get......" + idx);
		return mapper.read(idx) ;
	}

	@Override
	public boolean modify(ProjectInfoDto project) {
		log.info("modify......" + project);
		return mapper.update(project) == 1;
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
	public List<ProjectInfoDto> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
			
}
