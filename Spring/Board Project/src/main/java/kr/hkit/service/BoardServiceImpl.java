package kr.hkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.domain.BoardDTO;
import kr.hkit.domain.Criteria;
import kr.hkit.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	@Override
	public List<BoardDTO> getAll(Criteria cri) {
		log.info("*****getListWithPaging..." + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public void register(BoardDTO board) {
		log.info("*****register-----" + board);
		mapper.insert(board);
	}

	@Override
	public BoardDTO get(Long bno) {
		log.info("*****get...");
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardDTO board) {
		log.info("****modify" + board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("****remove..." + bno);
//		boolean result = (mapper.delete(bno) == 1);
		return mapper.delete(bno)==1;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("****get total count");
		return mapper.getTotalCount(cri);
	}
	
}
