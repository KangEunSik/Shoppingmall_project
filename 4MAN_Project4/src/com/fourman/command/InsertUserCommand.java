package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.fourman.dao.UserDao;
import com.fourman.dto.UserDto;

public class InsertUserCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		
		String mailid=request.getParameter("mailid");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String pn2=request.getParameter("pn2");
		String pn3=request.getParameter("pn3");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		
		String address=address1+address2;
		String Mail=mailid+"@"+email;
		String PhNum=phone+"-"+pn2+"-"+pn3;
		
		UserDto dto=new UserDto();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pwd"));
		dto.setUserName(request.getParameter("name"));
		dto.setEmail(Mail);
		dto.setAddress(address);
		dto.setPhoneNum(PhNum);
		
		UserDao dao =new UserDao();
		int i=dao.insert(dto);
		
		request.setAttribute("dto", dto);
		request.setAttribute("i", i);
			
	}

}
