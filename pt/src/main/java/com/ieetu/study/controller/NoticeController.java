package com.ieetu.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ieetu.study.domain.NoticeDto;
import com.ieetu.study.paging.Criteria;
import com.ieetu.study.paging.PageNum;
import com.ieetu.study.service.NoticeService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/notice/*")
public class NoticeController {
    
    @Autowired
    NoticeService noticeservice;
    
    @GetMapping("/list")

    public ModelAndView readNotice(Criteria cri, HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView();

        mav.setViewName("/post/listForm");
        
        mav.addObject("pageMaker", new PageNum(cri, noticeservice.getTotalCount(cri)));
        
        mav.addObject("noticeInfo", noticeservice.readNoticeInfo(cri));
        
        return mav;

    }
    
    @GetMapping("/info")
    
    public ModelAndView readNoticeOne(@RequestParam("idx") int idx) {
        
        log.info(idx);
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("/post/infoForm");
        
        mav.addObject("noticeInfoOne", noticeservice.readNoticeInfoOne(idx));
        
        return mav;
        
    }
    
    @GetMapping("/regist")
    
    public ModelAndView makePost(HttpServletRequest request, HttpSession session) {

        ModelAndView mav = new ModelAndView();
        
        mav.addObject("mbrNm", session.getAttribute("mbrNm"));
        
        mav.setViewName("/post/registerForm");
        
        return mav;
    }
    
    @PostMapping("/save")
    
    public ModelAndView makePost(NoticeDto notice) {
        
        noticeservice.registNoticeInfo(notice);
        
        ModelAndView mav = new ModelAndView();
        
        mav.setViewName("redirect:/notice/list");
        
        return mav;
        
    }

}
