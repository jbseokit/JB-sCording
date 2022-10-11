package com.ieetu.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ieetu.study.domain.MemberDto;
import com.ieetu.study.service.RegistrationService;

import lombok.extern.log4j.Log4j2;

@RestController
@Log4j2

public class RegistrationController {
	
	@Autowired
	RegistrationService regSerivce;
	
	@GetMapping("/regist")
    
    public ModelAndView regist() {
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("/login/registerForm");
        
        return mav;
    }
    
    @PostMapping("/regist")
    
    public ModelAndView regist(MemberDto mbr) {
        log.info(mbr);
        regSerivce.registMember(mbr);
        log.info("-----회원가입 후");
        
        ModelAndView mav = new ModelAndView();
        
        // url 호출
        mav.setViewName("redirect:/home");
        
        return mav;
        
    }
}
