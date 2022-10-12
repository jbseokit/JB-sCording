package com.ieetu.study.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ieetu.study.domain.NoticeDto;

@Mapper

public interface NoticeMapper {

    public List<NoticeDto> selectNoticeInfo();
    
    public NoticeDto selectNoticeInfoOne(int idx);
    
    public void insertNoticeInfo(NoticeDto notice);
    
}
