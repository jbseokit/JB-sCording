package com.yh2.db.model;

import java.io.Serializable;

public class JwtRequest implements Serializable {
	private static final long serialVersionUID = 5926468583005150707L;
	private String username;
	private String password;
	
	// constructor
	public JwtRequest() {
		super();
	}

	public JwtRequest(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	// getter & setter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
