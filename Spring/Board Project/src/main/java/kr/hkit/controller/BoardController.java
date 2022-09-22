package kr.hkit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.hkit.domain.BoardDTO;
import kr.hkit.domain.Criteria;
import kr.hkit.domain.PageDTO;
import kr.hkit.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("***list");
//		model.addAttribute("list", service.getAll());
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("****list : " + cri);
		model.addAttribute("list", service.getAll(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		log.info("****total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardDTO board, RedirectAttributes rttr) {
		log.info("*****register : " + board);
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getTitle());
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("****get");
		model.addAttribute("board", service.get(bno)); 
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("*****modify : " + board);
		
//		if(service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}else {
//			rttr.addFlashAttribute("result", "fail");
//		}
		service.modify(board);
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/remove") //Request = Get and Post
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("****remove : " + bno);
		
//		if(service.remove(bno)) {
//			rttr.addFlashAttribute("result", "success");
//		}else {
//			rttr.addFlashAttribute("result", "fail");
//		}
		service.remove(bno);
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		
		return "redirect:/board/list";
	}
	
}
