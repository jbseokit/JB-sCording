package kr.hkit.pms.service.project;

import java.util.List;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectScheDto;

public interface ProjectScheService {
	
	public void register(ProjectScheDto s_project);
	
	public ProjectScheDto get(Long idx);
	
	public boolean modify(ProjectScheDto s_project);
	
	public boolean remove(Long idx);
	
	public List<ProjectScheDto> getList(Criteria cri);
	
//	public List<ProjectInfoDto> getList();
			
	public int getTotal(Criteria cri);

	
}
