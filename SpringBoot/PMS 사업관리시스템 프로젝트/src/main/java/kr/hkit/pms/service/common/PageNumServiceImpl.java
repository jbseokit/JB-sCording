package kr.hkit.pms.service.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.mapper.common.PageNumMapper;

@Service
public class PageNumServiceImpl implements PageNumService {
	
	@Autowired
	private PageNumMapper pnm;
	
	@Override
	public int getTotalHr(Criteria cri) {
		return pnm.getTotalCountHr(cri);
	}
	
	@Override
	public int getTotalAt(Criteria cri) {
		return pnm.getTotalCountAt(cri);
	}
	
	@Override
	public int getTotalVa(Criteria cri) {
		return pnm.getTotalCountVa(cri);
	}
	
}
