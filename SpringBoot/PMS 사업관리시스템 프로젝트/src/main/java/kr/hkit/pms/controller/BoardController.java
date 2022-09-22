package kr.hkit.pms.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/board/*")
public class BoardController {
	
	@GetMapping("/free")
	public ModelAndView getFree() {
		log.info("-----자유게시판");
		ModelAndView mav = new ModelAndView("/board/free");
			
		return mav;
	}
	
	@GetMapping("/notice")
	public ModelAndView getNotice() {
		log.info("-----공지사항");
		ModelAndView mav = new ModelAndView("/board/notice");
		return mav;
	}
	
	@GetMapping("/ref")
	public ModelAndView getRef() {
		log.info("-----자료실");
		ModelAndView mav = new ModelAndView("/board/ref");
		return mav;
	}
}
