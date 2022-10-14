package com.ieetu.study.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.servlet.ModelAndView;

import com.ieetu.study.service.LoginService;

@RestController

public class LoginController {
    
    @Autowired
    LoginService loginservice;
    
    @GetMapping("/home")
    
    public ModelAndView readloginForm() {
        
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("공개키", "view에 전송할 공개키");
        
        mav.setViewName("/login/loginForm");
        
        return mav;
        
    }
    
    @PostMapping("/auth")
    
    public ModelAndView authMember() throws Exception {
        
        ModelAndView mav = new ModelAndView();
        
        // service로 인증 절차 걸친 후 if 문 사용해서 아래 코드 수행
        
        mav.setViewName("redirect:/notice/list");
        
        return mav;
    }
    
    /*
     * @GetMapping("/auth")
     * 
     * public Map<Object, Object> checkid(@RequestBody String id) {
     * 
     * int count = 0;
     * 
     * Map<Object, Object> map = new HashMap<Object, Object>();
     * 
     * count = loginservice.checkid(id);
     * 
     * map.put("cnt", count);
     * 
     * return map;
     * 
     * }
     */
    
    
    
}
