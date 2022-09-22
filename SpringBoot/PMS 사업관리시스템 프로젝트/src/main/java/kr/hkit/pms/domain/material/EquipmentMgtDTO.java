package kr.hkit.pms.domain.material;

import java.util.Date;

import lombok.Data;

@Data
public class EquipmentMgtDTO {

	private int idx;
	private String eqm_nm;
	private String eqm_use_dep_cd;
	private String eqm_man_dep_cd;
	private String eqm_num;
	private Date eqm_buy_date;
	private Date eqm_ins_date;
	private String eqm_tel;
	private Date eqm_rep_req_date;
	private Date eqm_rep_com_date;
	private int eqm_amount;
	private int eqm_price;
	private String spare1;
	private String spare2;

}
