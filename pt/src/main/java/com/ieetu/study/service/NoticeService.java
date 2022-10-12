package com.ieetu.study.service;

import java.util.List;

import com.ieetu.study.domain.NoticeDto;

public interface NoticeService {
    
    public List<NoticeDto> readNoticeInfo();
    
    public NoticeDto readNoticeInfoOne(int idx);
    
    public void registNoticeInfo(NoticeDto notice);
    
}
