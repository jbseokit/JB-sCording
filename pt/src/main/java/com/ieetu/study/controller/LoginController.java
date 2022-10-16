package com.ieetu.study.controller;


import java.security.PrivateKey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ieetu.study.crypto.module.RsaModule;
import com.ieetu.study.crypto.vo.RsaVo;
import com.ieetu.study.domain.MemberDto;
import com.ieetu.study.service.LoginService;



@RestController

public class LoginController {
    
    @Autowired
    LoginService loginservice;
    
    @GetMapping("/home")
    
    public ModelAndView readloginForm(HttpServletRequest request, HttpServletResponse response) {
    	
    	HttpSession session = request.getSession();
    	
    	PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
    	
    	ModelAndView mav = new ModelAndView();
    	
    	RsaModule rsaModule = new RsaModule();
    	
    	if (key != null) {
    		
    		session.removeAttribute("RSAprivateKey");
    		
    	}

    	RsaVo rsaVo = rsaModule.createRsa();
    	
    	// 세션에 개인키 저장
    	session.setAttribute("RSAprivateKey", rsaVo.getPrivateKey());
            
        // 공개키 클라이언트 페이지에 전달
        mav.addObject("modulus", rsaVo.getModulus());
        
        mav.addObject("exponent", rsaVo.getExponent());
        
        mav.setViewName("/login/loginForm");
        
        return mav;
        
    }
    
    @PostMapping("/auth")
    
    public ModelAndView authMember(HttpServletRequest request, MemberDto member, RedirectAttributes redirect) throws Exception {
        
    	ModelAndView mav = new ModelAndView();
    	
    	RsaModule rsaModule = new RsaModule();
    	
    	HttpSession session = request.getSession();
    	
    	PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
    	
    	if (key == null) {
    		
    		// redirect 시 url에 파라미터 표시 X
    		redirect.addFlashAttribute("resultMsg", "로그인을 재시도 해주세요.");
    		
    		mav.setViewName("redirect:/home");
    		
    		return mav;
    		
    	}
    	
    	// 세션에 저장된 키의 유효성 검사 이후 key에 담은 뒤 삭제
    	session.removeAttribute("RSAprivateKey");
    	
    	// POST 방식으로 JSP로 부터 받아온 아이디 비밀번호 복호화
    	String decId = rsaModule.getDecryptText(key, member.getMbrId());
    	
    	String decPw = rsaModule.getDecryptText(key, member.getMbrPw());
    	
    	member.setMbrId(decId);
    	
    	member.setMbrPw(decPw);
    	
    	// DB에서 사용자 아이디 및 비밀번호 조회 결과
        boolean result = loginservice.authMember(member);
        
        if (result == true) {
        	
        	 session.setMaxInactiveInterval(1800);
        	 
        	 session.setAttribute("mbrNm", loginservice.authMemberName(member));
        	 
        	 mav.setViewName("redirect:/notice/list");
             
             return mav;
        	
        } else {
        	
        	redirect.addFlashAttribute("resultMsg", "아이디 혹은 비밀번호를 확인해주세요.");
        	
        	mav.setViewName("redirect:/home");
        	
        	return mav;
        }
        
       
    }
       
}
