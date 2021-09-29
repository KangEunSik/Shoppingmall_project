package com.fourman.command;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.fourman.dao.AdminDao;
import com.fourman.dao.UserDao;
import com.fourman.dto.ProductDto;
import com.fourman.dto.UserDto;



public class UpdateUserCommand implements ICommand {
	
	
//	private String Id;
//	private String Pw;
//	private String UserName;
//	private String Email;
//	private String Address;
//	private String PhoneNum;

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id=request.getParameter("userId");
		String pw=request.getParameter("userpw");
		String name=request.getParameter("name");
		String mail=request.getParameter("mailid");
		String domain=request.getParameter("email");
		String email=mail+"@"+domain;
		
		String pn1=request.getParameter("pn");
		String pn2=request.getParameter("pn2");
		String pn3=request.getParameter("pn3");
		String phone=pn1+pn2+pn3;
		
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String address=address1+address2;
		UserDao user_up= new UserDao();
		int i=user_up.user_update(id, name, pw, email, phone, address);
		request.setAttribute("user_update", i);
		

	}

}
