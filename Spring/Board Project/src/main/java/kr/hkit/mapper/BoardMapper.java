package kr.hkit.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import kr.hkit.domain.BoardDTO;
import kr.hkit.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardDTO> getList(); //전체출력
	public List<BoardDTO> getListWithPaging(Criteria cri); //페이징 처리
	
	public void insert(BoardDTO board); //C
	
	public BoardDTO read(Long bno); //R
	
	public int update(BoardDTO board); //U
	
	public int delete(Long bno); //D
	
	public int getTotalCount(Criteria cri);
}
