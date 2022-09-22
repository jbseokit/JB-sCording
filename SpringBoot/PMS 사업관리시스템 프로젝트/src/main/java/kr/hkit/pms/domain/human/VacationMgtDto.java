package kr.hkit.pms.domain.human;

import java.util.Date;

import lombok.Data;

@Data
public class VacationMgtDto {
	private int 	idx;
	private String	vac_nm;
	private String	vac_sn;
	private Date	vac_str;
	private Date	vac_end;
	private String	vac_type;
	private int		vac_cnt;
	private String	spare1;
	private String	spare2;
	private String	spare3;
	private String	spare4;
	private String	rgtr_id;
	private Date	rgtr_dt;
	private String	mdfr_id;
	private Date	mdfr_dt;
}
