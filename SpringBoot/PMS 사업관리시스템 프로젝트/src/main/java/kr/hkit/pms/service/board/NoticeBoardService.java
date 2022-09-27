package kr.hkit.pms.service.board;

import java.util.List;

import kr.hkit.pms.domain.board.BoardNoticeDTO;
import kr.hkit.pms.domain.common.Criteria;



public interface NoticeBoardService {
	
public Long register(BoardNoticeDTO noticeboard);
	
	public BoardNoticeDTO get(Long IDX);
	
	public int modify(BoardNoticeDTO noticeboard);
	
	public int remove(Long IDX);
	
	public List<BoardNoticeDTO> noticegetList();
	
	public List<BoardNoticeDTO> noticegetList(Criteria cri);
	
	public int gettotalcount(Criteria cri);
	
}
