package kr.hkit.pms.mapper.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.board.BoardFreeDTO;
import kr.hkit.pms.domain.common.Criteria;

@Mapper
public interface BoardFreeMapper {

	// 리스트 보기
	public List<BoardFreeDTO> freegetList();
	
	// 글 만들기
	public void Freeinsert(BoardFreeDTO boardfree);
	
	// 글 만들기 선택 번호
	public void insertSelectKey(BoardFreeDTO boardfree);
	
	// 글 조회
	public BoardFreeDTO freeread(Long IDX);
	
	// 삭제
	public int freedelete(Long IDX); 
	
	// 글 수정
	public int freeupdate(BoardFreeDTO boardfree);
	
	
	// 페이징
	public List<BoardFreeDTO> getListWithPaging(Criteria cri);
	
	
	public int gettotalcount(Criteria cri);
	
	//검색
	public List<BoardFreeDTO> searchT(Map<String, Map<String,String>> map);
	
}
