package com.ieetu.study.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileDto {
    
    private int idx;
    
    private String fileOwner;
    
    private String fileOrgNm;
    
    private String fileSavedNm;
    
    private String fileSavedPath;
    
    private Long fileSize;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date fileSavedDate;
    
}
