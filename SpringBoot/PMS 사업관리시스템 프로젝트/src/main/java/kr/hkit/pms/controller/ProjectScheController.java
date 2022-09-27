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
import kr.hkit.pms.domain.project.ProjectScheDto;
import kr.hkit.pms.service.project.ProjectScheService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@RestController
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectScheController {

	private ProjectScheService s_service;

////////////////////////////////////////////////////////////////////////////////////////////////
//  목록 보기
	@GetMapping("/s_info")
	public ModelAndView info(Criteria cri) {
		
		log.info("s_info: " + cri);
		int total = s_service.getTotal(cri);
		
		log.info("total: " + total);
		ModelAndView mav = new ModelAndView();
		mav.addObject("s_info", s_service.getList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, total));
		mav.setViewName("/project/s_info");
		//model.addAttribute("info", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		return mav;
		
		
		//model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
// 등록	
	@PostMapping("/s_register")
	public String register(ProjectScheDto s_project, RedirectAttributes rttr) {
		
		log.info("s_register: " + s_project);
		s_service.register(s_project);
		rttr.addFlashAttribute("reuslt", s_project.getIdx());
		return "redirect:/project/s_info";
	}
	
	@GetMapping("/s_register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/project/s_register"); //jsp 호출
		return mav;
	}
//  조회
	@GetMapping({"/s_get","/s_modify"})
	public void get(@RequestParam("idx") Long idx, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/s_get or s_modify");
		model.addAttribute("s_project", s_service.get(idx));
	}
// 수정
	@PostMapping("/s_modify")
	public String modify(ProjectScheDto s_project, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("s_modify:" + s_project);
	
	if (s_service.modify(s_project)) {
		rttr.addFlashAttribute("result", "success");
	}
	
	rttr.addAttribute("pageNum",cri.getPageNum());
	rttr.addAttribute("amount", cri.getAmount());
	
	return "redirect:/project/s_info";
}
// 삭제
	@PostMapping("/s_remove")
	public String remove(@RequestParam("idx") Long idx, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("s_remove..." + idx);
		if (s_service.remove(idx)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/project/s_info";
	}
}
////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	