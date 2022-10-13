package com.ieetu.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ieetu.study.domain.NoticeDto;
import com.ieetu.study.paging.Criteria;

@Mapper

public interface NoticeMapper {

    public List<NoticeDto> selectNoticeInfo(Criteria cri);
    
    public NoticeDto selectNoticeInfoOne(int idx);
    
    public int selectTotalCount(Criteria cri);
    
    public void insertNoticeInfo(NoticeDto notice);
    
}
