package kr.hkit.pms.domain.sales;

import java.sql.Date;

import lombok.Data;

@Data
public class SalesSpendDto {

	private Long SPEND_MANA_IDX;
	private String SPEND_MANA_DEP;
	private String SPEND_MANA_MANA;
	private String SPEND_MANA_ACC;
	private String SPEND_MANA_AS;
	private String SPEND_MANA_BRI;
	private int SPEND_MANA_AMO;
	private String SPEND_MANA_COSTP;
	private String SPEND_MANA_MEMO;

}
