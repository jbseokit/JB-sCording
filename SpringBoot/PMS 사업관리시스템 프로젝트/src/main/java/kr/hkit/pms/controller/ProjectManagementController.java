package kr.hkit.pms.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/project/*")
public class ProjectManagementController {

/////////////////////////////////////////////////////// 왼쪽 목록창	
	@GetMapping("/dashboard")
	public ModelAndView getInDashBoard() {
		log.info("-----대시보드");
		ModelAndView mav = new ModelAndView("/project/dashboard");
		return mav;
	}
	
	@GetMapping("/projectlist")
	public ModelAndView getInDashBoardList() {
		log.info("-----프로젝트목록");
		ModelAndView mav = new ModelAndView("/project/projectlist");
		return mav;
	}
	
//////////////////////////////////////////////////// 오른쪽 화면창	
	@GetMapping("/info")
	public ModelAndView getProInfo() {
		log.info("-----프로젝트 정보 관리");
		ModelAndView mav = new ModelAndView("/project/info");
		return mav;
	}
	
	@GetMapping("/members")
	public ModelAndView getInMem() {
		log.info("-----참여 인원 관리");
		ModelAndView mav = new ModelAndView("/project/members");
		return mav;
	}
	
	@GetMapping("/schedual")
	public ModelAndView getEquip() {
		log.info("-----프로젝트 일정 관리");
		ModelAndView mav = new ModelAndView("/project/schedual");
		return mav;
	}
	
	}
