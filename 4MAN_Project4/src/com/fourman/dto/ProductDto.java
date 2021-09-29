package com.fourman.dto;

import java.util.Date;

public class ProductDto {
	private String PNum;	//상품코드(기본키)
	private String Pname;		//상품명
	private String Pkind;			//상품 종류
	private int Pprice;			// 상품가격
	private String PContent; 		//상품내용
	private String Pimage; 		//상품이미지
	private String Pbest;			//상품베스트
	private Date Pregist;
	
	public ProductDto() {}
	public ProductDto(String pNum, String pname, String pkind, int pprice, String pContent, String pimage, String pbest, Date pregist) {
		super();
		PNum = pNum;
		Pname = pname;
		Pkind = pkind;
		Pprice = pprice;
		PContent = pContent;
		Pimage = pimage;
		Pbest = pbest;
		Pregist = pregist;
	}
	public String getPNum() {
		return PNum;
	}
	public void setPNum(String pNum) {
		PNum = pNum;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
	}
	public String getPkind() {
		return Pkind;
	}
	public void setPkind(String pkind) {
		Pkind = pkind;
	}
	public int getPprice() {
		return Pprice;
	}
	public void setPprice(int pprice) {
		Pprice = pprice;
	}
	public String getPContent() {
		return PContent;
	}
	public void setPContent(String pContent) {
		PContent = pContent;
	}
	public String getPimage() {
		return Pimage;
	}
	public void setPimage(String pimage) {
		Pimage = pimage;
	}
	
	public String getPbest() {
		return Pbest;
	}
	public void setPbest(String pbest) {
		Pbest = pbest;
	}
	public Date getPregist() {
		return Pregist;
	}
	public void setPregist(Date pregist) {
		Pregist = pregist;
	}
	
	
}
