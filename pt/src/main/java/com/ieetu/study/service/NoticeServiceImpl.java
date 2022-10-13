package com.ieetu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ieetu.study.domain.NoticeDto;
import com.ieetu.study.mapper.NoticeMapper;
import com.ieetu.study.paging.Criteria;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class NoticeServiceImpl implements NoticeService {
    
    @Autowired
    NoticeMapper noticeMapper;
    
    @Override
    public List<NoticeDto> readNoticeInfo(Criteria cri) {
        
        // XML에서 LIMIT에 연산자 사용 시 SQL 에러 발생
        // LIMIT을 사용한 페이징 처리를 위해 offset 값을 변경
        int nowPage = (cri.getPageNum()-1) * cri.getAmount();
        
        cri.setPageNum(nowPage);
        
        return noticeMapper.selectNoticeInfo(cri);
        
    }

    @Override
    public NoticeDto readNoticeInfoOne(int idx) {
        
        log.info("단일 정보 서비스 시작 -> 매퍼 작동 전");
        
        return noticeMapper.selectNoticeInfoOne(idx);
    }

    @Override
    public void registNoticeInfo(NoticeDto notice) {
        
        log.info("공지사항 정보 입력 서비스 시작");
        
        noticeMapper.insertNoticeInfo(notice);
        
    }

    @Override
    public int getTotalCount(Criteria cri) {
        
        return noticeMapper.selectTotalCount(cri);
    }
    
    
    
    

}
