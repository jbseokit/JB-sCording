package kr.hkit.service;

import java.util.List;

import kr.hkit.domain.BoardDTO;
import kr.hkit.domain.Criteria;

public interface BoardService {
	
	public List<BoardDTO> getAll(); //전체출력
	public List<BoardDTO> getAll(Criteria cri); //페이징 처리
	
	public void register(BoardDTO board); //C
	
	public BoardDTO get(Long bno); //R
	
	public boolean modify(BoardDTO board); //U
	
	public boolean remove(Long bno); //D
	
	public int getTotal(Criteria cri);
}
