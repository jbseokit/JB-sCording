package kr.hkit.pms.mapper.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.project.ProjectMbrDto;

@Mapper
public interface ProjectMbrMapper {

	//@Select("select * from prj_mbr_tb where idx > 0")
	public List<ProjectMbrDto> getList();
	
	public List<ProjectMbrDto> getListWithPaging(Criteria cri);
	
	public void insert(ProjectMbrDto project);
	
	public void insertSelectKey(ProjectMbrDto project);
	
	public ProjectMbrDto read(Long idx);
	
	public int delete(Long idx);
	
	public int update(ProjectMbrDto project);
	
	public int getTotalCount(Criteria cri);
}
