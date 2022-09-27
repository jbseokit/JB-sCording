package kr.hkit.pms.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hkit.pms.service.project.ProjectService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/project/*")
@AllArgsConstructor
public class DashBoardController {
	
	// 프로젝트 대시보드
	@GetMapping("/dashboard")
	public ModelAndView getDashboard() {
		log.info("-----대시보드");
		ModelAndView mav = new ModelAndView("/project/dashboard");
		return mav;
	}

}
