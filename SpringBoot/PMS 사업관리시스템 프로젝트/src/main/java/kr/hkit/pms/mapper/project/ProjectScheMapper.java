package kr.hkit.pms.mapper.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectScheDto;

@Mapper
public interface ProjectScheMapper {

	public List<ProjectScheDto> getList();
	
	public List<ProjectScheDto> getListWithPaging(Criteria cri);
	
	public void insert(ProjectScheDto project);
	
	public void insertSelectKey(ProjectScheDto project);
	
	public ProjectScheDto read(Long idx);
	
	public int delete(Long idx);
	
	public int update(ProjectScheDto project);
	
	public int getTotalCount(Criteria cri);
}
