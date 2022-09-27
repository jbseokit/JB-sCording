package kr.hkit.pms.domain.project;

import lombok.Data;

@Data
public class ProjectInfoDto {
	
	private Long idx;
	private String prjinfo_prjnm;
	private String prjinfo_ef;
	private String prjinfo_cp;
	private String prjinfo_task;
	private String prjinfo_req;
	private String prjinfo_sales;
	private String prjinfo_tool;
	private String prjinfo_cpmanager;
	private String prjinfo_cptel;
	private String prjinfo_cpfax;
	
}
