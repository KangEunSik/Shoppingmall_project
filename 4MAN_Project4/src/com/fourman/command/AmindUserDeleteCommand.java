package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;

public class AmindUserDeleteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		
		AdminDao admindao=new AdminDao();
		int i=admindao.deleteuser(id);
		request.setAttribute("deleteuser", i);
	}

}
