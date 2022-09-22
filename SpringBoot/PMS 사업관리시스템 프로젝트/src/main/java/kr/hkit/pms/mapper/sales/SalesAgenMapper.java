package kr.hkit.pms.mapper.sales;

import java.util.List;

import kr.hkit.pms.domain.sales.SalesAgenDto;

public interface SalesAgenMapper {
	
	public List<SalesAgenDto> getList();
	
	public void insert(SalesAgenDto agen_board);
	public SalesAgenDto read(Long AGEN_INFO_IDX);
	public int delete(Long AGEN_INFO_IDX);	
	public int update(SalesAgenDto agen_board);
	
}
