package com.fourman.dto;

import java.util.Date;

public class OrderDetailDto {
	private String ordernum;
	private String userid;
	private String pnum;
	private String pname;
	private String pimage;
	private int orderprice;
	private int ordercount;
	private String psize;
	private String pcolor;
	private Date orderdate;
	
	
	@Override
	public String toString() {
		return "OrderDetailDto [ordernum=" + ordernum + ", userid=" + userid + ", pnum=" + pnum + ", pname=" + pname
				+ ", pimage=" + pimage + ", orderprice=" + orderprice + ", ordercount=" + ordercount + ", psize="
				+ psize + ", pcolor=" + pcolor + ", orderdate=" + orderdate + "]";
	}
	public OrderDetailDto() {}
	public OrderDetailDto(String ordernum, String userid, String pnum, String pname, String pimage, int orderprice,
			int ordercount, String psize, String pcolor, Date orderdate) {
		super();
		this.ordernum = ordernum;
		this.userid = userid;
		this.pnum = pnum;
		this.pname = pname;
		this.pimage = pimage;
		this.orderprice = orderprice;
		this.ordercount = ordercount;
		this.psize = psize;
		this.pcolor = pcolor;
		this.orderdate = orderdate;
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


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public String getPimage() {
		return pimage;
	}


	public void setPimage(String pimage) {
		this.pimage = pimage;
	}


	public int getOrderprice() {
		return orderprice;
	}


	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
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

}