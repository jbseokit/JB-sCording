package kr.hkit.pms.service.human;

import java.util.List;

import kr.hkit.pms.domain.human.*;

public interface HumanResourcesService {
	
	public List<HumanInfoMgtDto> getInfoList();
	
	public List<AttendMgtDto> getAttendList();
	
	public List<VacationMgtDto> getVacationList();
	
}
