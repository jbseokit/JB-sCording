package kr.hkit.pms.mapper.project;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectInfoDto;

@Mapper
public interface ProjectInfoMapper {

	public List<ProjectInfoDto> getList();
	
	public List<ProjectInfoDto> getListWithPaging(Criteria cri);
	
	public void insert(ProjectInfoDto project);
	
	public void insertSelectKey(ProjectInfoDto project);
	
	public ProjectInfoDto read(Long idx);
	
	public int delete(Long idx);
	
	public int update(ProjectInfoDto project);

	public int getTotalCount(Criteria cri);
	
	
}
