package kr.hkit.pms.service.board;

import kr.hkit.pms.domain.board.BoardDto;

public interface Board {
	// 게시글 등록
	public boolean registerBoard(BoardDto params);
}
