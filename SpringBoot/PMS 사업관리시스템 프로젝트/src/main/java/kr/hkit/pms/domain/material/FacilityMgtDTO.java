package kr.hkit.pms.domain.material;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FacilityMgtDTO {
	
	private int idx;
	private String fct_nm;
	private String fct_user_sn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fct_str;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fct_end;
	private String spare1;
	private String spare2;
	private String spare3;

}