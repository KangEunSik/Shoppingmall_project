package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.OrderDetailDto;

public class OrderDetailCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id=request.getParameter("userId");
		
		UserDao dao=new UserDao();
		ArrayList<OrderDetailDto> orderdetail=dao.select_order(id);
		request.setAttribute("orderdetail", orderdetail);
		
	}

}
