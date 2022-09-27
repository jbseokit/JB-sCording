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
import kr.hkit.pms.domain.project.ProjectInfoDto;
import kr.hkit.pms.service.project.ProjectService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@RestController
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectInfoController {

	private ProjectService service;

////////////////////////////////////////////////////////////////////////////////////////////////
//  목록 보기
	@GetMapping("/info")
	public ModelAndView info(Criteria cri) {
		
		log.info("info: " + cri);
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", service.getList(cri));
		mav.addObject("pageMaker", new PageNumDto(cri, total));
		mav.setViewName("/project/info");
		//model.addAttribute("info", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri,123));
		return mav;
		
		
		//model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
// 등록	
	@PostMapping("/register")
	public String register(ProjectInfoDto project, RedirectAttributes rttr) {
		
		log.info("register: " + project);
		service.register(project);
		rttr.addFlashAttribute("reuslt", project.getIdx());
		return "redirect:/project/info";
	}
	
	@GetMapping("/register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/project/register"); //jsp 호출
		return mav;
	}
//  조회
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("idx") Long idx, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("project", service.get(idx));
	}
// 수정
	@PostMapping("/modify")
	public String modify(ProjectInfoDto project, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + project);
	
	if (service.modify(project)) {
		rttr.addFlashAttribute("result", "success");
	}
	
	rttr.addAttribute("pageNum",cri.getPageNum());
	rttr.addAttribute("amount", cri.getAmount());
	
	return "redirect:/project/info";
}
// 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("idx") Long idx, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + idx);
		if (service.remove(idx)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/project/info";
	}
////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
		


}
