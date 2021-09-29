package com.fourman.dto;

import java.util.Date;

public class OrderDto {
	private String ordernum;
	private String userid;
	private String pnum;
	private int ordercount;
	private String psize;
	private String pcolor;
	private Date orderdate;
	private int orderprice;
	
	
	public OrderDto() {}
	public OrderDto(String ordernum, String userid, String pnum, int ordercount, String psize, String pcolor,
			Date orderdate, int orderprice) {
		super();
		this.ordernum = ordernum;
		this.userid = userid;
		this.pnum = pnum;
		this.ordercount = ordercount;
		this.psize = psize;
		this.pcolor = pcolor;
		this.orderdate = orderdate;
		this.orderprice = orderprice;
	}


	public String getOrdernum() {
		return ordernum;
	}


	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPnum() {
		return pnum;
	}


	public void setPnum(String pnum) {
		this.pnum = pnum;
	}


	public int getOrdercount() {
		return ordercount;
	}


	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}


	public String getPsize() {
		return psize;
	}


	public void setPsize(String psize) {
		this.psize = psize;
	}


	public String getPcolor() {
		return pcolor;
	}


	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}


	public Date getOrderdate() {
		return orderdate;
	}


	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}


	public int getOrderprice() {
		return orderprice;
	}


	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	
	
}
