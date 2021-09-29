package com.fourman.dto;

public class AdminLogin {
	private String sysid;
	private String syspw;
	
	public AdminLogin() {}
	public AdminLogin(String sysid, String syspw) {
		super();
		this.sysid = sysid;
		this.syspw = syspw;
	}
	public String getSysid() {
		return sysid;
	}
	public void setSysid(String sysid) {
		this.sysid = sysid;
	}
	public String getSyspw() {
		return syspw;
	}
	public void setSyspw(String syspw) {
		this.syspw = syspw;
	}
	
	
	
	
}
