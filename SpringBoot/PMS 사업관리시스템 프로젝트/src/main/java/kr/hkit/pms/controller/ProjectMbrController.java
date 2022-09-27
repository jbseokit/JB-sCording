package kr.hkit.pms.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.hkit.pms.domain.common.Criteria;
import kr.hkit.pms.domain.common.PageNumDto;

import kr.hkit.pms.domain.project.ProjectMbrDto;
import kr.hkit.pms.service.project.ProjectMbrService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@RestController
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectMbrController {

	private ProjectMbrService m_service;

////////////////////////////////////////////////////////////////////////////////////////////////
//  목록 보기
	@GetMapping("/m_info")
	public ModelAndView info(Criteria cri) {
		
		log.info("m_info: " + cri);
		int total = m_service.getTotal(cri);
		
		log.info("total: " + total);
		ModelAndView mav = new ModelAndView();
		mav.addObject("m_info", m_service.getList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, total));
		mav.setViewName("/project/m_info");
		//model.addAttribute("info", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		return mav;
		
		
		//model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
// 등록	
	@PostMapping("/m_register")
	public String register(ProjectMbrDto m_project, RedirectAttributes rttr) {
		
		log.info("m_register: " + m_project);
		m_service.register(m_project);
		rttr.addFlashAttribute("reuslt", m_project.getIdx());
		return "redirect:/project/m_info";
	}
	
	@GetMapping("/m_register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/project/m_register"); //jsp 호출
		return mav;
	}
//  조회
	@GetMapping({"/m_get","/m_modify"})
	public void get(@RequestParam("idx") Long idx, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/m_get or m_modify");
		model.addAttribute("project", m_service.get(idx));
	}
// 수정
	@PostMapping("/m_modify")
	public String modify(ProjectMbrDto m_project, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + m_project);
	
	if (m_service.modify(m_project)) {
		rttr.addFlashAttribute("result", "success");
	}
	
	rttr.addAttribute("pageNum",cri.getPageNum());
	rttr.addAttribute("amount", cri.getAmount());
	
	return "redirect:/project/m_info";
}
// 삭제
	@PostMapping("/m_remove")
	public String remove(@RequestParam("idx") Long idx, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + idx);
		if (m_service.remove(idx)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/project/m_info";
	}
////////////////////////////////////////////////////////////////////////////////////////////////////

	
	

		


	
}
