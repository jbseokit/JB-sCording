package kr.hkit.pms.domain.common;

import lombok.Data;

@Data
public class LoginDto {
	private String mbr_id;
	private String mbr_pw;
	private String mbr_sn;
	
}
