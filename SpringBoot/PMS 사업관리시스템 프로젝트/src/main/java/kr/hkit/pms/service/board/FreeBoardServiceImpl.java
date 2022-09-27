package kr.hkit.pms.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.board.BoardFreeDTO;
import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.mapper.board.BoardFreeMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	private BoardFreeMapper mapper;
	
	@Override
	public Long register(BoardFreeDTO freeboard) {	
		mapper.insertSelectKey(freeboard);
		
		return freeboard.getIDX();
	}
	
	@Override
	public BoardFreeDTO get(Long IDX) {
		return mapper.freeread(IDX);
	}

	@Override
	public int modify(BoardFreeDTO freeboard) {
		return mapper.freeupdate(freeboard);
	 }

	@Override
	public int remove(Long IDX) {
		return mapper.freedelete(IDX);
	}

	@Override
	public List<BoardFreeDTO> FreegetList() {
		return mapper.freegetList();
	}

	@Override
	public List<BoardFreeDTO> FreegetList(Criteria cri) {	
		return mapper.getListWithPaging(cri);
	}	
	
	@Override
	public int gettotalcount(Criteria cri) {
		return mapper.gettotalcount(cri);
	}
	
}
