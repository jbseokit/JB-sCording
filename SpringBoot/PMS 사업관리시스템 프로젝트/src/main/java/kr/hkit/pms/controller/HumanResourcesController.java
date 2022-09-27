package kr.hkit.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.common.PageNumDto;
import kr.hkit.pms.domain.human.AttendMgtDto;
import kr.hkit.pms.domain.human.HumanInfoMgtDto;
import kr.hkit.pms.domain.human.VacationMgtDto;
import kr.hkit.pms.service.common.PageNumService;
import kr.hkit.pms.service.human.HumanResourcesService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/human/*")
public class HumanResourcesController {
	
	@Autowired
	HumanResourcesService hrs;
	
	@Autowired
	PageNumService pns;
	
	// -----------------------------hr Controller-----------------------------
	
	// R
	@GetMapping("/hr-list")
	public ModelAndView selectHrList(Criteria cri) {
		log.info("-----인적 정보");
		int total = pns.getTotalHr(cri);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/human/selectHrList");
		mav.addObject("humanInfo", hrs.selectHrList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, total));
		return mav;
	}
	
	@GetMapping("/hr")
	public ModelAndView selectHr(@RequestParam("mbr_sn") String mbr_sn) {
		log.info("-----hr select controller : get");
		ModelAndView mav = new ModelAndView();
		mav.addObject("human", hrs.selectHr(mbr_sn));
		mav.setViewName("/human/selectHr");
		log.info("휴대폰 복호화 : " + hrs.selectHr(mbr_sn).getMbr_phone());
		log.info("비밀번호 복호화 : " + hrs.selectHr(mbr_sn).getMbr_pw());
		return mav;
	}
	
	// C
	@GetMapping("/hr-register")
	public ModelAndView registerHr() {
		log.info("-----hr register controller : get");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/human/registerHr");
		return mav;
	}
	
	@PostMapping("/hr-register")
	public ModelAndView registerHr(HumanInfoMgtDto human) {
		log.info("-----hr register controller : post : " + human);
		hrs.registerHr(human); // 등록
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/human/hr-list"); // url 호출
		return mav;
	}
	
	// U
	@GetMapping("/hr-modify")
	public ModelAndView modifyHr(@RequestParam("mbr_sn") String mbr_sn) {
		log.info("-----hr modify controller : get");
		ModelAndView mav = new ModelAndView();
		mav.addObject("human", hrs.selectHr(mbr_sn));
		mav.setViewName("/human/modifyHr");
		return mav;
	}
	
	@PostMapping("/hr-modify")
	public ModelAndView modifyHr(HumanInfoMgtDto human) {
		log.info("-----hr modify controller : post");
		hrs.modifyHr(human);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/human/hr-list");
		return mav;
	}
	
	// D
	@GetMapping("/hr-remove")
	public ModelAndView removeHr(@RequestParam("mbr_sn") String mbr_sn) {
		log.info("-----hr remove controller : get");
		hrs.removeHr(mbr_sn);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/human/hr-list");
		return mav;
	}
	
	// -----------------------------at Service-----------------------------
	
	// R
	@GetMapping("/at-list")
	public ModelAndView selectAtList(Criteria cri) {
		log.info("-----출결 정보");
		int total = pns.getTotalAt(cri);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/human/selectAtList");
		mav.addObject("humanAttend", hrs.selectAtList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, total));
		return mav;
	}
	
	@GetMapping("/at")
	public ModelAndView selectAt(@RequestParam("atd_sn") String atd_sn) {
		log.info("-----at select controller : get");
		ModelAndView mav = new ModelAndView();
		mav.addObject("attend", hrs.selectAt(atd_sn));
		mav.setViewName("/human/selectAt");
		return mav;
	}
	
	// C
	@GetMapping("/at-register")
	public ModelAndView registerAt() {
		log.info("-----at register controller : get");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/human/registerAt");
		return mav;
	}
	
	@PostMapping("/at-register")
	public ModelAndView registerAt(AttendMgtDto attend) {
		log.info("-----at register controller : post : " + attend);
		hrs.registerAt(attend); // 등록
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/human/at-list"); // url 호출
		return mav;
	}
	
	// U
	@GetMapping("/at-modify")
	public ModelAndView modifyAt(@RequestParam("atd_sn") String atd_sn) {
		log.info("-----at modify controller : get");
		hrs.modifyAt(atd_sn);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/human/at-list");
		return mav;
	}
	
	
	// -----------------------------va Service-----------------------------
	
	// R
	@GetMapping("/va-list")
	public ModelAndView selectVaList(Criteria cri) {
		log.info("-----휴가 정보");
		int total = pns.getTotalVa(cri);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/human/selectVaList");
		mav.addObject("humanVacation", hrs.selectVaList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, total));
		return mav;
	}
	
	@GetMapping("/va")
	public ModelAndView selectVa(@RequestParam("vac_sn") String vac_sn) {
		log.info("-----va select controller : get");
		ModelAndView mav = new ModelAndView();
		mav.addObject("vacation", hrs.selectVa(vac_sn));
		mav.setViewName("/human/selectVa");
		return mav;
	}
	
	// C
		@GetMapping("/va-register")
		public ModelAndView registerVa() {
			log.info("-----va register controller : get");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/human/registerVa");
			return mav;
		}
		
		@PostMapping("/va-register")
		public ModelAndView registerVa(VacationMgtDto vacation) {
			log.info("-----va register controller : post : " + vacation);
			hrs.registerVa(vacation); // 등록
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/human/va-list"); // url 호출
			return mav;
		}
		
	// U
	@GetMapping("/va-modify")
	public ModelAndView modifyVa(@RequestParam("vac_sn") String vac_sn) {
		log.info("-----va modify controller : get");
		ModelAndView mav = new ModelAndView();
		mav.addObject("vacation", hrs.selectVa(vac_sn));
		mav.setViewName("/human/modifyVa");
		return mav;
	}
	
	@PostMapping("/va-modify")
	public ModelAndView modifyVa(VacationMgtDto vacation) {
		log.info("-----va modify controller : post");
		hrs.modifyVa(vacation);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/human/va-list");
		return mav;
	}
}
