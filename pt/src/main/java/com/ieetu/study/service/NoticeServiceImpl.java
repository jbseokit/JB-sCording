package com.ieetu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ieetu.study.domain.NoticeDto;
import com.ieetu.study.mapper.NoticeMapper;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class NoticeServiceImpl implements NoticeService {
    
    @Autowired
    NoticeMapper noticemapper;
    
    @Override
    public List<NoticeDto> readNoticeInfo() {
        
        log.info("서비스 시작 -> 매퍼 작동 전");
        
        return noticemapper.selectNoticeInfo();
        
    }

    @Override
    public NoticeDto readNoticeInfoOne(int idx) {
        
        log.info("단일 정보 서비스 시작 -> 매퍼 작동 전");
        
        return noticemapper.selectNoticeInfoOne(idx);
    }

    @Override
    public void registNoticeInfo(NoticeDto notice) {
        
        log.info("공지사항 정보 입력 서비스 시작");
        
        noticemapper.insertNoticeInfo(notice);
        
    }
    
    
    
    

}
