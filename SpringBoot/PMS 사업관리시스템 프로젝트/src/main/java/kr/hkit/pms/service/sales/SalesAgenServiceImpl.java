package kr.hkit.pms.service.sales;

import kr.hkit.pms.domain.sales.SalesAgenDto;
import kr.hkit.pms.mapper.sales.SalesAgenMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

@Log4j2
public class SalesAgenServiceImpl implements SalesAgenService {

	@Setter(onMethod_ = {@Autowired})
	private SalesAgenMapper mapper;
	
	
	@Override
	public void register(SalesAgenDto agen_board) {
		log.info("register---" + agen_board);
		
		mapper.insert(agen_board);
	}

	@Override
	public SalesAgenDto get(Long AGEN_INFO_IDX) {
		log.info("get............");
		return mapper.read(AGEN_INFO_IDX);
	}

	@Override
	public boolean modify(SalesAgenDto agen_board) {
		log.info("modify........." + agen_board);
		return mapper.update(agen_board)==1;
	}

	@Override
	public boolean remove(Long AGEN_INFO_IDX) {
		log.info("remove......"+ AGEN_INFO_IDX);
		return mapper.delete(AGEN_INFO_IDX) == 1;
	}
	

	//페이지 리스트 출력
	@Override
	public List<SalesAgenDto> getAll() {
		log.info("getAll..........." );
		return mapper.getList();
	}


}
