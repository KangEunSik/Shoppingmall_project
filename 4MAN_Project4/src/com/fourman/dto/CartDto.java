package com.fourman.dto;

public class CartDto {
	private String cartnum;
	private String id;
	private String pnum;
	private int ordercount;
	private String psize;
	private String pcolor;
	private int cartprice;
	
	
	public CartDto() {}
	

	public CartDto(String cartnum, String id, String pnum, int ordercount, String psize, String pcolor, int cartprice) {
		super();
		this.cartnum = cartnum;
		this.id = id;
		this.pnum = pnum;
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


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public int getCartprice() {
		return cartprice;
	}


	public void setCartprice(int cartprice) {
		this.cartprice = cartprice;
	}
	
}
