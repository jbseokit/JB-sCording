package kr.hkit.pms.domain.material;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SoftwareMgtDTO {

	private int idx;
	private String sw_nm;
	private String sw_use_dep_cd;
	private String sw_man_dep_cd;
	private String sw_num;
	private String sw_com;
	private Date sw_buy_date;
	private Date sw_ins_date;
	private Date sw_renew_date;
	private String sw_tel;
	private int sw_amount;
	private int sw_price;
	private String spare1;
	private String spare2;
	private String spare3;

}

