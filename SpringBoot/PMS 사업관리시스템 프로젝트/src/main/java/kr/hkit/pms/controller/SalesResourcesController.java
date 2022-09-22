package kr.hkit.pms.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/sales/*")
public class SalesResourcesController {
	
	@GetMapping("/agency")
	public ModelAndView getAgency() {
		log.info("-----기관 정보 관리");
		ModelAndView mav = new ModelAndView("/sales/agency");
		return mav;
	}
	
	@GetMapping("/agency_insert")
	public ModelAndView getAgencyInsert() {
		ModelAndView mav = new ModelAndView("/sales/agency_insert");
		return mav;
	}
	
	@GetMapping("/agency_read")
	public ModelAndView getAgencyRead() {
		ModelAndView mav = new ModelAndView("/sales/agency_read");
		return mav;
	}
	
	
	@GetMapping("/spend")
	public ModelAndView getEquip() {
		log.info("-----지출 관리");
		ModelAndView mav = new ModelAndView("/sales/spend");
		return mav;
	}
	
	@GetMapping("/spend_insert")
	public ModelAndView getSpendInsert() {
		ModelAndView mav = new ModelAndView("/sales/spend_insert");
		return mav;
	}
	

	
}
