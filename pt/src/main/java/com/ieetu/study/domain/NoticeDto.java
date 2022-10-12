package com.ieetu.study.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class NoticeDto {
    
    private int idx;
    
    private String ntStatus;
    
    private String ntTitle;
    
    private String ntWriter;
    
    private String ntContent;
    
    // Controller에서 Date 타입을 받아오지 못 해서 @DateTimeFormat으로 미리 알려주는 방법을 사용
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ntRegDate;
    
}
