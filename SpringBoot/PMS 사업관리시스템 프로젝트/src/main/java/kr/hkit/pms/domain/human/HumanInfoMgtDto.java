package kr.hkit.pms.domain.human;

import java.util.Date;

import lombok.Data;

@Data
public class HumanInfoMgtDto {
	private int 	idx;
	private String	mbr_sn;
	private String 	mbr_nm;
	private String  mbr_enm;
	private Date	mbr_birth;
	private String	mbr_tel;
	private String	mbr_phone;
	private String	mbr_em;
	private String	mbr_fax;
	private String	mbr_addr_bx;
	private String	mbr_addr_dtl;
	private String	mbr_addr_post;
	private String	mbr_dep_cd;
	private Date	mbr_hired_d;
	private Date	mbr_fired_d;
	private String	mbr_id;
	private String	mbr_pw;
	private String	mbr_cls_cd;
	private String	mbr_main_task;
	private String	mbr_dis;
	private String	mbr_vtr;
	private String	spare1;
	private String	spare2;
	private String	spare3;
	private String	spare4;
	private String	rgtr_id;
	private Date	rgtr_dt;
	private String	mdfr_id;
	private Date	mdfr_dt;
}
