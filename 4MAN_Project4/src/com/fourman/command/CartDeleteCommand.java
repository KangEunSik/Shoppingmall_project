package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;

public class CartDeleteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
			String id=request.getParameter("userId");
			String pnum=request.getParameter("pnum");
			
			UserDao cartDelete = new UserDao();
			int i=cartDelete.cartdelete(id,pnum);
			request.setAttribute("detele", cartDelete);
	}

}
