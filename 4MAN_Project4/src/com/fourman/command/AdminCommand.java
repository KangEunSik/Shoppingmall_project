package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.command.ICommand;
import com.fourman.dao.AdminDao;
import com.fourman.dto.AdminLogin;


public class AdminCommand implements ICommand{
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("loginid");
//		String pw=request.getParameter("loginpw");
//		AdminDao dao= new AdminDao();
//		ArrayList<AdminLogin> dtos=
////				dao.select(request.getParameter(id), request.getParameter(pw));
//				
//				request.setAttribute("dtos", dtos);
	}
}
