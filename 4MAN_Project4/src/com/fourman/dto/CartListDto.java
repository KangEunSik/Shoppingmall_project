package com.fourman.dto;

public class CartListDto {
	private String cartnum;
	private String pnum;
	private String pname;
	private String pimage;
	private int ordercount;
	private String psize;
	private String pcolor;
	private int cartprice;
	
	
	public CartListDto() {}


	public CartListDto(String cartnum, String pnum, String pname, String pimage, int ordercount, String psize,
			String pcolor, int cartprice) {
		super();
		this.cartnum = cartnum;
		this.pnum = pnum;
		this.pname = pname;
		this.pimage = pimage;
		this.ordercount = ordercount;
		this.psize = psize;
		this.pcolor = pcolor;
		this.cartprice = cartprice;
	}


	public String getCartnum() {
		return cartnum;
	}


	public void setCartnum(String cartnum) {
		this.cartnum = cartnum;
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


	public int getCartprice() {
		return cartprice;
	}


	public void setCartprice(int cartprice) {
		this.cartprice = cartprice;
	}

	

	
	
	
	
	
}
