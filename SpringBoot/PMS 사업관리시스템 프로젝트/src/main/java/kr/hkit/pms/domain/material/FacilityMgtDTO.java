package kr.hkit.pms.domain.material;

import java.util.Date;

import lombok.Data;

@Data
public class FacilityMgtDTO {
	
	private int idx;
	private String fct_nm;
	private String fct_use_sn;
	private Date fct_str;
	private Date fct_end;
	private String spare1;
	private String spare2;
	private String spare3;

}