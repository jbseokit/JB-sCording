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
import kr.hkit.pms.domain.material.EquipmentMgtDTO;
import kr.hkit.pms.domain.material.FacilityMgtDTO;

import kr.hkit.pms.domain.material.SoftwareMgtDTO;
import kr.hkit.pms.service.material.MaterialFacillityService;
import kr.hkit.pms.service.material.MaterialMgtService;
import kr.hkit.pms.service.material.MaterialSoftwareService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/material/*")
public class MaterialResourcesController {
	//의존성 주입
	@Autowired
	private MaterialMgtService eqm;
	@Autowired
	private MaterialSoftwareService sw;
	@Autowired
	private MaterialFacillityService fct;
	
	
	//equipment------------------------------------------------------------------------------------------	 
	
	//장비 리스트
	@GetMapping("/equip/list")
	public ModelAndView equipList(Criteria cri, ModelAndView mav) {
		log.info("-----장비 정보 관리");
		
		mav.setViewName("/material/equip_list");
		int total = eqm.getTotal(cri);
		mav.addObject("equipList", eqm.ListAll());
		mav.addObject("comboList", eqm.comboListAll());
		mav.addObject("equipList", eqm.getEquipmentListAll(cri));
		mav.addObject("pageMaker", new PageNumDto(cri,total));
		return mav;
	
	}
	//이름별 목록
	@GetMapping("/equip/list/combo")  
	public ModelAndView equipListcombo(String eqm_nm) {
		log.info("-----장비 이름별 목록");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/material/equip_listcombo");
		mav.addObject("comboListPage", eqm.comboListPageAll(eqm_nm));
		return mav;
	}

	
	//장비 정보 등록 화면 이동
	@GetMapping("/equip/reg")
	public ModelAndView equipReg() {
		log.info("-----장비 정보 등록 화면");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/material/equip_reg");
		return mav;
	}
	
	//장비 정보 등록 
	@PostMapping("/equip/reg")
	public ModelAndView equipReg( EquipmentMgtDTO emd) {
		log.info("-----장비 정보 등록" + eqm);
		ModelAndView mav = new ModelAndView();
		eqm.Register(emd);
		mav.setViewName("redirect:/material/equip/list");
		return mav;
	}
	
	//장비 상세 정보 화면 이동
	@GetMapping("/equip/detail")
	public ModelAndView equipDetail(@RequestParam("idx") int idx ) {
		log.info("-----장비 상세 정보 화면 이동" + idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("equip", eqm.ListGet(idx));
		mav.setViewName("/material/equip_detail");
		return mav;
	}
	
	//장비 정보 수정 화면 이동
	@GetMapping("/equip/modify")
	public ModelAndView equipModify(@RequestParam("idx")int idx) {
		log.info("-----장비 정보 수정 " + idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("equip", eqm.ListGet(idx));
		mav.setViewName("/material/equip_modify");
		return mav;
	}
			
	//장비 정보 수정
	@PostMapping("/equip/modify")
	public ModelAndView equipModify(EquipmentMgtDTO emd) {
		log.info("-----장비 정보 수정 " + emd);
		ModelAndView mav = new ModelAndView();
		eqm.Mdify(emd);
		mav.setViewName("redirect:/material/equip/list");
		return mav;
	}
			
	//장비 정보 삭제 
	@RequestMapping("/equip/remove")
	public ModelAndView equipRemove(@RequestParam("idx") int idx ) {
		log.info("-----장비 정보 삭제 이동" + idx );
		ModelAndView mav = new ModelAndView();
		eqm.Remove(idx);
		mav.setViewName("redirect:/material/equip/list");
		return mav;
	}	
	
	// SW ------------------------------------------------------------------------------------------------
	
	//소프트웨어 리스트 
	@GetMapping("/sw/list")
	public ModelAndView swList(Criteria cri, ModelAndView mav) {
		log.info("-----소프트웨어 정보 관리");

		mav.setViewName("/material/sw_list");
		int total = sw.getTotal(cri);
		mav.addObject("swList", sw.ListAll());
		mav.addObject("comboList", sw.comboListAll());
		mav.addObject("swList", sw.getSoftwareListAll(cri));
		mav.addObject("pageMaker", new PageNumDto(cri,total));
		return mav;
	}
	
	//이름별 목록
	@GetMapping("/sw/list/combo")
	public ModelAndView swListcombo(String sw_nm) {
		log.info("-----소프트웨어 이름별 목록");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/material/sw_listcombo");
		mav.addObject("comboListPage", sw.comboListPageAll(sw_nm));
		return mav;
	}
	
	//소프트웨어 정보 등록 화면 이동
	@GetMapping("/sw/reg")
	public ModelAndView swReg() {
		log.info("-----소프트웨어 정보 등록 화면");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/material/sw_reg");
		return mav;
	}
	
	//소프트웨어 정보 등록 
	@PostMapping("/sw/reg")
	public ModelAndView swReg(SoftwareMgtDTO smd) {
		log.info("-----소프트웨어 정보 등록" + smd);
		ModelAndView mav = new ModelAndView();
		sw.Register(smd);
		mav.setViewName("redirect:/material/sw/list");
		return mav;
	}	
		
	//소프트웨어 상세 정보 화면 이동
	@GetMapping("/sw/detail") 
	public ModelAndView sw(@RequestParam("idx")int idx) { 
		log.info("-----소프트웨어 상세 정보 화면 이동" + idx); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("software", sw.ListGet(idx));
		mav.setViewName("material/sw_detail"); 
		return mav;
	}
	
	//소프트웨어 정보 수정 화면 이동
	@GetMapping("/sw/modify")
	public ModelAndView swModify(@RequestParam("idx")int idx) {
		log.info("-----소프트웨어 정보 수정 " + sw);
		ModelAndView mav = new ModelAndView();
		mav.addObject("software", sw.ListGet(idx));
		mav.setViewName("/material/sw_modify");
		return mav;
	}
		
	//소프트웨어 정보 수정
	@PostMapping("/sw/modify")
	public ModelAndView swModify(SoftwareMgtDTO smd) {
		log.info("-----소프트웨어 정보 수정 " + sw);
		ModelAndView mav = new ModelAndView();
		sw.Mdify(smd);
		mav.setViewName("redirect:/material/sw/list");
		return mav;
	}
		
	//소프트웨어 정보 삭제 
	@RequestMapping("/sw/remove")
	public ModelAndView swRemove(@RequestParam("idx") int idx ) {
		log.info("-----소프트웨어 정보 삭제 이동" + idx );
		ModelAndView mav = new ModelAndView();
		sw.Remove(idx);
		mav.setViewName("redirect:/material/sw/list");
		return mav;
	}	
	

	// facility------------------------------------------------------------------------------------------	
	
		//시설 리스트
		@GetMapping("/fct/list")
		public ModelAndView fctList(Criteria cri, ModelAndView mav) {
			log.info("-----시설 정보 관리");
			
			int total = fct.getTotal(cri);
			mav.setViewName("/material/fct_list");
			mav.addObject("fctList", fct.ListAll());
			mav.addObject("comboList", fct.comboListAll());
			mav.addObject("fctList", fct.getFacilityListAll(cri));
			mav.addObject("pageMaker", new PageNumDto(cri,total));
			return mav;
		}
	
		//이름별 목록
		@GetMapping("/fct/list/combo")
		public ModelAndView fctListcombo(String fct_nm) {
			log.info("-----시설 이름별 목록");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/material/fct_listcombo");
			mav.addObject("comboListPage", fct.comboListPageAll(fct_nm));
			return mav;
					
		}
		
		//시설 정보 등록 화면 이동
		@GetMapping("/fct/reg")
		public ModelAndView fctReg() {
			log.info("-----시설 정보 등록 화면");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/material/fct_reg");
			return mav;
		}
		
		//시설 정보 등록 
		@PostMapping("/fct/reg")
		public ModelAndView fctReg(FacilityMgtDTO fmd) {
			log.info("-----시설 정보 등록" + fmd);
			ModelAndView mav = new ModelAndView();
			fct.Register(fmd);
			mav.setViewName("redirect:/material/fct/list");
			return mav;
		}
		
		//시설 상세 정보 화면 이동
		@GetMapping("/fct/detail")
		public ModelAndView fctDetail(@RequestParam("idx")int idx) {
			log.info("-----시설 정보 등록 화면");
			ModelAndView mav = new ModelAndView();
			mav.addObject("facility", fct.ListGet(idx));
			mav.setViewName("/material/fct_detail");
			return mav;
		}
		
		//시설 정보 수정 화면 이동
		@GetMapping("/fct/modify")
		public ModelAndView fctModify(@RequestParam("idx")int idx) {
			log.info("-----시설 정보 수정 " );
			ModelAndView mav = new ModelAndView();
			mav.addObject("facility", fct.ListGet(idx));
			mav.setViewName("/material/fct_modify");
			return mav;
		}
			
		//시설 정보 수정
		@PostMapping("/fct/modify")
		public ModelAndView fctModify(FacilityMgtDTO fmd) {
			log.info("----시설 정보 수정 ");
			ModelAndView mav = new ModelAndView();
			fct.Mdify(fmd);
			mav.setViewName("redirect:/material/fct/list");
			return mav;
		}

		//시설 정보 삭제 
		@RequestMapping("/fct/remove")
		public ModelAndView fctRemove(@RequestParam("idx") int idx ) {
			log.info("-----시설 정보 삭제 이동" + idx );
			ModelAndView mav = new ModelAndView();
			fct.Remove(idx);
			mav.setViewName("redirect:/material/fct/list");
			return mav;
		}	
	
	
	
}
