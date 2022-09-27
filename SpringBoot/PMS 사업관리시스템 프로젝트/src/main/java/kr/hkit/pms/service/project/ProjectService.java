package kr.hkit.pms.service.project;

import java.util.List;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectInfoDto;

public interface ProjectService {
	
	public void register(ProjectInfoDto project);
	
	public ProjectInfoDto get(Long idx);
	
	public boolean modify(ProjectInfoDto project);
	
	public boolean remove(Long idx);
	
	public List<ProjectInfoDto> getList(Criteria cri);
				
	public int getTotal(Criteria cri);

	
}
