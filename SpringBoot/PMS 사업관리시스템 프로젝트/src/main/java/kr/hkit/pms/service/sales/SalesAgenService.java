package kr.hkit.pms.service.sales;

import java.util.List;

import kr.hkit.pms.domain.sales.SalesAgenDto;

public interface SalesAgenService {
	public void register(SalesAgenDto agen_board);
	public SalesAgenDto get(Long AGEN_INFO_IDX);
	public boolean modify(SalesAgenDto agen_board);
	public boolean remove(Long AGEN_INFO_IDX);
	public List<SalesAgenDto> getAll();
}