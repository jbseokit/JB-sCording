package kr.hkit.pms.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.board.BoardNoticeDTO;
import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.mapper.board.BoardNoticeMapper;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Autowired
	private BoardNoticeMapper mapper;

	
	@Override
	public Long register(BoardNoticeDTO noticeboard) {
		mapper.insertSelectKey(noticeboard);
		return noticeboard.getIDX();
	}

	@Override
	public BoardNoticeDTO get(Long IDX) {
		return mapper.noticeread(IDX);
	}

	@Override
	public int modify(BoardNoticeDTO noticeboard) {
		return mapper.noticeupdate(noticeboard);
	}

	@Override
	public int remove(Long IDX) {
		return mapper.noticedelete(IDX);
	}

	@Override
	public List<BoardNoticeDTO> noticegetList() {
		return mapper.noticegetList();
	}

	@Override
	public List<BoardNoticeDTO> noticegetList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int gettotalcount(Criteria cri) {
		return mapper.gettotalcount(cri);
	}

	
	
		
	
}
