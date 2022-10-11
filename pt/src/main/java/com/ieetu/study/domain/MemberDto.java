package com.ieetu.study.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    
    private int idx;
    private String mbrNm;
    private String mbrPhone;
    private String mbrEm;
    private String mbrId;
    private String mbrPw;
    
}
