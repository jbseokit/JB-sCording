package kr.hkit.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hkit.pms.service.material.MaterialSoftwareServive;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/material/*")
public class MaterialResourcesController {
	
	@Autowired
	private MaterialSoftwareServive service;
	 
	@GetMapping("/equip")
	public ModelAndView getEquip() {
		log.info("-----장비 정보 관리");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/material/equip");
		mav.addObject("list", service.getAll() );
		return mav;
	}
	
	@GetMapping("/fac")
	public ModelAndView getFac() {
		log.info("-----시설 관리");
		ModelAndView mav = new ModelAndView("/material/fac");
		return mav;
	}
	
	@GetMapping("/sw")
	public ModelAndView getInfo() {
		log.info("-----SW 정보 관리");
		ModelAndView mav = new ModelAndView("/material/sw");
		return mav;
	}
}
