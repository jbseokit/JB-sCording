package kr.hkit.pms.service.project;

import java.util.List;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectMbrDto;

public interface ProjectMbrService {
	
	public void register(ProjectMbrDto m_project);
	
	public ProjectMbrDto get(Long idx);
	
	public boolean modify(ProjectMbrDto m_project);
	
	public boolean remove(Long idx);
	
	public List<ProjectMbrDto> getList(Criteria cri);
	
//	public List<ProjectInfoDto> getList();
			
	public int getTotal(Criteria cri);
}
