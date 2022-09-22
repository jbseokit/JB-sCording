package kr.hkit.pms.domain.sales;

import java.sql.Date;

import lombok.Data;

@Data
public class SalesAgenDto {

	private Long AGEN_INFO_IDX;
	private String AGEN_INFO_AN;
	private int AGEN_INFO_BRN;
	private String AGEN_INFO_RN;
	private String AGEN_INFO_RTEL;
	private String AGEN_INFO_ADD;
	private String AGEN_INFO_AWEBSITE;
	private String AGEN_INFO_MANAGER;
	private String AGEN_INFO_MTN;
	private String AGEN_INFO_MEMAIL;

}
