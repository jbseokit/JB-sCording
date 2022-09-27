package kr.hkit.pms.service.common;

import kr.hkit.pms.domain.common.Criteria;

public interface PageNumService {
	public int getTotalHr(Criteria cri);
	
	public int getTotalAt(Criteria cri);
	
	public int getTotalVa(Criteria cri);
}
