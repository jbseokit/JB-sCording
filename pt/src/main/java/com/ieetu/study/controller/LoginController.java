package com.ieetu.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ieetu.study.domain.MemberDto;
import com.ieetu.study.service.LoginService;

@RestController

public class LoginController {
    
    @Autowired
    LoginService loginservice;
    
    @GetMapping("/home")
    
    public ModelAndView login() {
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("login/home");
        
        mav.addObject("members", loginservice.selectMember());
        
        return mav;
        
    }
    
    @GetMapping("/regist")
    
    public ModelAndView regist1() {
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("login/register");
        
        return mav;
    }
    
    @PostMapping("/regist")
    
    public ModelAndView regist(MemberDto mbr) {
        
        loginservice.registMember(mbr);
        
        ModelAndView mav = new ModelAndView();
        
        // url 호출
        mav.setViewName("redirect:/login/home");
        
        return mav;
        
    }
    
    
    
}
