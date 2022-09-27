package kr.hkit.pms.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.hkit.pms.domain.board.BoardNoticeDTO;
import kr.hkit.pms.domain.common.Criteria;

@Mapper
public interface BoardNoticeMapper {
	
	
	// 리스트 보기
		public List<BoardNoticeDTO> noticegetList();
		
		// 글 만들기
		public void noticeinsert(BoardNoticeDTO boardnotice);
		
		// 글 만들기 선택 번호
		public void insertSelectKey(BoardNoticeDTO boardnotice);
		
		// 글 조회
		public BoardNoticeDTO noticeread(Long IDX);
		
		// 삭제
		public int noticedelete(Long IDX); 
		
		// 글 수정
		public int noticeupdate(BoardNoticeDTO boardnotice);
		
		
		// 페이징
		public List<BoardNoticeDTO> getListWithPaging(Criteria cri);
		
		
		public int gettotalcount(Criteria cri);
}
