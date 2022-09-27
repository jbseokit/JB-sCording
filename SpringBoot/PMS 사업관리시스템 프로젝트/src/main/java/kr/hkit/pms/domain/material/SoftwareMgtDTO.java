package kr.hkit.pms.domain.material;

import java.util.Date;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
public class SoftwareMgtDTO {

	private int idx;
	private String sw_nm;
	private String sw_use_dep;
	private String sw_man_dep;
	private String sw_num;
	private String sw_com;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sw_buy_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sw_ins_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sw_renew_date;
	private String sw_tel;
	private int sw_amount;
	private int sw_price;
	private String spare1;
	private String spare2;
	private String spare3;

}

