package com.ieetu.study.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ieetu.study.domain.NoticeDto;

import com.ieetu.study.paging.Criteria;

public interface NoticeService {
    
    public List<NoticeDto> readNoticeInfo(Criteria cri);
    
    public NoticeDto readNoticeInfoOne(int idx);
    
    public void registNoticeInfo(List<MultipartFile> files, NoticeDto notice);
    
    public int getTotalCount(Criteria cri);
    
}
