package kr.hkit.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.hkit.pms.domain.board.BoardFreeDTO;
import kr.hkit.pms.domain.board.BoardNoticeDTO;
import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.common.PageNumDto;
import kr.hkit.pms.service.board.FreeBoardService;
import kr.hkit.pms.service.board.NoticeBoardService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	FreeBoardService service;
	
	@Autowired
	NoticeBoardService noticeservice;
	
	@GetMapping("/freelist")
	public ModelAndView FreeList(Criteria cri) { 
		log.info("-----자유게시판 리스트");
		log.info(cri);
		ModelAndView mav = new ModelAndView();
		mav.addObject("freelist", service.FreegetList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri,service.gettotalcount(cri)));
		mav.setViewName("/board/freelist");
		
		return mav;
	}
	
	@GetMapping("/freeregister")
	public ModelAndView FreeRegisterGET() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/freeregister");
		return mav;
	}
	
	@PostMapping("/freeregister")
	public ModelAndView FreeRegister(BoardFreeDTO freeboard, RedirectAttributes rttr) {
		log.info("freeboard" + freeboard);
		service.register(freeboard);
		rttr.addFlashAttribute("result", freeboard.getIDX());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/freelist");
		return mav;
	}
	
	
	
	@GetMapping("/freeget")
	public ModelAndView Freeget(@RequestParam("IDX") Long IDX, @ModelAttribute("cri") Criteria cri) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("freegettt", service.get(IDX));
		mav.addObject("freelist", service.FreegetList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, service.gettotalcount(cri)));
		
		return mav;
	}
	
	
	@GetMapping("/freemodify")
	public ModelAndView FreegetModify(@RequestParam("IDX") Long IDX, @ModelAttribute("cri") Criteria cri) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("freegettt", service.get(IDX));
		mav.addObject("freelist", service.FreegetList(cri));
		
		return mav;
	}
	
	@PostMapping("/freemodify")
	public ModelAndView FreeModify(BoardFreeDTO freeboard, Criteria cri) {
		service.modify(freeboard);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/freelist");
		mav.addObject("pageNum", cri.getPageNum());
		mav.addObject("amount", cri.getAmount());
		mav.addObject("type", cri.getType());
		mav.addObject("keyword", cri.getKeyword());
		return mav;
	}
	
	@PostMapping("/freeremove")
	public ModelAndView FreeRemove(@RequestParam("IDX") Long IDX) {
		log.info("------삭제----");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/freelist");
		mav.addObject("/freeremove", service.remove(IDX));
		return mav;
	}
	
	
	

	// 공지사항
	
	
	@GetMapping("/noticelist")
	public ModelAndView NoticeList(Criteria cri) { 
		log.info("-----자유게시판 리스트");
		log.info(cri);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticelist", noticeservice.noticegetList(cri));
		mav.addObject("pageMaker",  new PageNumDto(cri,noticeservice.gettotalcount(cri)));
		mav.setViewName("/board/noticelist");
		
		return mav;
	}
	
	@GetMapping("/noticeregister")
	public ModelAndView NoticeRegisterGET() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/noticeregister");
		return mav;
	}
	
	@PostMapping("/noticeregister")
	public ModelAndView NoticeRegister(BoardNoticeDTO noticeboard, RedirectAttributes rttr) {
		log.info("freeboard" + noticeboard);
		noticeservice.register(noticeboard);
		rttr.addFlashAttribute("result", noticeboard.getIDX());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/noticelist");
		return mav;
	}

	
	
	@GetMapping("/noticeget")
	public ModelAndView Noticeget(@RequestParam("IDX") Long IDX, @ModelAttribute("cri") Criteria cri) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticegettt", noticeservice.get(IDX));
		mav.addObject("noticelist", noticeservice.noticegetList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri,noticeservice.gettotalcount(cri)));
		
		return mav;
	}
	
	
	@PostMapping("/noticemodify")
	public ModelAndView NoticeModify(BoardNoticeDTO noticeboard, Criteria cri) {
		noticeservice.modify(noticeboard);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/noticelist");
		mav.addObject("pageNum", cri.getPageNum());
		mav.addObject("amount", cri.getAmount());
		mav.addObject("type", cri.getType());
		mav.addObject("keyword", cri.getKeyword());
		return mav;
	}
	
	
	
	@GetMapping("/noticemodify")
	public ModelAndView NoticegetModify(@RequestParam("IDX") Long IDX, @ModelAttribute("cri") Criteria cri) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticegettt", noticeservice.get(IDX));
		mav.addObject("noticelist", noticeservice.noticegetList(cri));
		
		return mav;
	}
	
	
	@PostMapping("/noticeremove")
	public ModelAndView NoticeRemove(@RequestParam("IDX") Long IDX) {
		log.info("------삭제----");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/board/noticelist");
		mav.addObject("/freeremove", noticeservice.remove(IDX));
		return mav;
	}
	
	
		
}