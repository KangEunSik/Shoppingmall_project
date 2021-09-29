package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.UserDto;

public  class FindpwCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String name=request.getParameter("name");
		String id=request.getParameter("id");
		String mailId=request.getParameter("mailid");
		String domain=request.getParameter("email");
		
		String email=mailId+"@"+domain;
		
		UserDao dao= new UserDao();
		ArrayList<UserDto> findPw=
				dao.findPw(name, id, email);
				
				request.setAttribute("findPw", findPw);
	}

	
	

}
