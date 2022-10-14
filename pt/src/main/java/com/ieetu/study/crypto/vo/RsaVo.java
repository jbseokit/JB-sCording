package com.ieetu.study.crypto.vo;

import java.security.PrivateKey;

import lombok.AllArgsConstructor;

import lombok.Getter;

import lombok.NoArgsConstructor;

import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RsaVo {

    private PrivateKey privateKey;
    
    private String modulus;
    
    private String exponent;

}
