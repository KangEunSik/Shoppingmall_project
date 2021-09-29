package com.fourman.command;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.OrderDto;

public class InsertOrderCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
//		private String ordernum;
//		private String userid;
//		private String pnum;
//		private int ordercount;
//		private String psize;
//		private String pcolor;
//		private Date orderdate;
		OrderDto orderdto = new OrderDto();
		int price=Integer.parseInt(request.getParameter("price"));
		int count=Integer.parseInt(request.getParameter("count"));
		
		int orderprice=price*count;
		
		orderdto.setUserid(request.getParameter("userId"));
		orderdto.setPnum(request.getParameter("pnum"));
		orderdto.setOrdercount(count);
		orderdto.setPsize(request.getParameter("size"));
		orderdto.setPcolor(request.getParameter("color"));
		orderdto.setOrderprice(orderprice);
		
		UserDao dao=new UserDao();
		int i=dao.insert_order(orderdto);
		request.setAttribute("orderdto", orderdto);
		
		
	}

}
