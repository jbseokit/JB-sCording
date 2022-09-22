package kr.hkit.pms.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.board.BoardDto;
//import kr.hkit.pms.mapper.board.BoardMapper;
import kr.hkit.pms.mapper.board.BoardMapper;

@Service
public class BoardImpl implements Board {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public boolean registerBoard(BoardDto params) {
		int queryResult = 0;
		
		//queryResult = boardMapper.insertBoard(params);
	
	return (queryResult == 1) ? true : false;
	}
}
