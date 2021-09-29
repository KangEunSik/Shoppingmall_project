package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.CartDto;
import com.fourman.dto.OrderDto;

public class InsertCartCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CartDto cartdto = new CartDto();
		cartdto.setId(request.getParameter("userId"));
		cartdto.setPnum(request.getParameter("pnum"));
		cartdto.setOrdercount(Integer.parseInt(request.getParameter("count")));
		cartdto.setPsize(request.getParameter("size"));
		cartdto.setPcolor(request.getParameter("color"));
		cartdto.setCartprice(Integer.parseInt(request.getParameter("price")));
		
		
		UserDao dao=new UserDao();
		int i=dao.insert_cart(cartdto);
		request.setAttribute("cartdto", cartdto);
	}

}
