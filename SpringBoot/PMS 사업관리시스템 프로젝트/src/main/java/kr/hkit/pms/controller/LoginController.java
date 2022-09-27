package kr.hkit.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.hkit.pms.domain.common.LoginDto;
import kr.hkit.pms.service.common.LoginService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
public class LoginController {
	
	@Autowired
	LoginService hs;
	
	@GetMapping("/")
	public ModelAndView login() {
		log.info("-----로그인 화면");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/snLogin");
		return mav;
	}
	
	@PostMapping("/")
	public ModelAndView login(@RequestParam("mbr_sn") String mbr_sn) {
		LoginDto enter = hs.selectHrLogin(mbr_sn);
		log.info("----로그인 post" + enter);
		ModelAndView mav = new ModelAndView();
		log.info("enter : " + enter);
		mav.addObject("enter", enter);
		mav.setViewName("/accountLogin");
		return mav;
	}
	
}
