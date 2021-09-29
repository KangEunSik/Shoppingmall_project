package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dto.OrderDto;
import com.fourman.dto.UserDto;

public class AmindOrderSearchCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		AdminDao admindao=new AdminDao();
		String ordernum = request.getParameter("serach");
		String userid = request.getParameter("serach");
		ArrayList<OrderDto> orderdto=admindao.search_order(ordernum, userid);
		request.setAttribute("search_order", orderdto);
	}

}
