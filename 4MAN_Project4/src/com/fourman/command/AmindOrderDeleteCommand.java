package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;

public class AmindOrderDeleteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ordernum=request.getParameter("ordernum");
		
		AdminDao admindao=new AdminDao();
		int i=admindao.orderdelete(ordernum);
				request.setAttribute("orderdelet", i);
	}

}
