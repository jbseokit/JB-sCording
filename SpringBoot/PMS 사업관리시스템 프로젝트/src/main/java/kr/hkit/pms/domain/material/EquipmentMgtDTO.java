package kr.hkit.pms.domain.material;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EquipmentMgtDTO {
	
	private int idx;
	private String eqm_nm;
	private String eqm_use_dep;
	private String eqm_man_dep;
	private String eqm_num;
	private String eqm_com;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eqm_buy_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eqm_ins_date;
	private String eqm_tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eqm_rep_req_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eqm_rep_com_date;
	private int eqm_amount;
	private int eqm_price;
}
