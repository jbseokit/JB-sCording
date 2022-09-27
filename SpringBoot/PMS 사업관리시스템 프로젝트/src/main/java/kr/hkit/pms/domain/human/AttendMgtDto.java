package kr.hkit.pms.domain.human;

import java.util.Date;

import lombok.Data;

@Data
public class AttendMgtDto {
	private int 	idx;
	private String  atd_nm;
	private String  atd_sn;
	private Date    atd_gw;
	private Date	atd_lw;
	private String	atd_bt;
	private String	atd_bt_dt;
	private String	atd_bt_ct;
	private String	atd_dp;
	private String	atd_dp_dt;
	private String	atd_dp_ct;
	private String	spare1;
	private String	spare2;
	private String	spare3;
	private String	rgtr_id;
	private Date	rgtr_dt;
	private String	mdfr_id;
	private Date	mdfr_dt;
}
