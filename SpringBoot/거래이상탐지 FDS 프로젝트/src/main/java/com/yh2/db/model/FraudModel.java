package com.yh2.db.model;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;


public class FraudModel {
	
	// 클라이언트가 보내주는 JSON 포맷 파일을 받기 위한 변수
	// Json 파싱을 위해 @JsonProperty 어노테이션 사용
	@JsonProperty("fileowner")
	private String fileowner;
	
	@JsonProperty("filename")
	private String filename;
	
	@JsonProperty("filetype")
	private String filetype;
	
	@JsonProperty("filetime")
	private Date filetime;
	
	
	// Json 파싱을 위한 get&set
	public String getFileowner() {
		return fileowner;
	}

	public void setFileowner(String fileowner) {
		this.fileowner = fileowner;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	
	
	public Date getFiletime() {
		return filetime;
	}

	public void setFiletime(Date filetime) {
		this.filetime = filetime;
	}

	public FraudModel() {
		
	}
	
	
	
	
}