package com.ieetu.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ieetu.study.service.LoginService;

@RestController

public class LoginController {
    
    @Autowired
    LoginService loginservice;
    
    @GetMapping("/home")
    
    public ModelAndView login() {
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("/login/loginForm");
        
        mav.addObject("members", loginservice.selectMember());
        
        return mav;
        
    }
    
}
