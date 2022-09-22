package com.yh2.db.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResultModel {

	@JsonProperty("resultcode")
	private String resultcode;

	public String getResultCode() {
		return resultcode;
	}

	public void setResultCode(String resultcode) {
		this.resultcode = resultcode;
	}

	public ResultModel(String resultcode) {
		this.resultcode = resultcode;
	}

	public ResultModel() {
	
	}
	
	
	
	

}
