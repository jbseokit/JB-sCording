package kr.hkit.pms.mapper.material;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.material.SoftwareMgtDTO;

@Mapper
public interface SoftwareMgtMapper {
	
	//전체 리스트
	public List<SoftwareMgtDTO> swList();
	//페이징 처리
	public List<SoftwareMgtDTO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public void insert(SoftwareMgtDTO smd);  //C
	public SoftwareMgtDTO getList(int idx);  //R
	public int update(SoftwareMgtDTO smd);  //U
	public int delete(int idx);  //D
	
	//이름별 목록 콤보박스
	public List<SoftwareMgtDTO> comboList();
	public List<SoftwareMgtDTO> comboListPage(String sw_nm);
	
}
