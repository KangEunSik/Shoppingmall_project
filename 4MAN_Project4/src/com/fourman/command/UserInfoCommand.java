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



public class UserInfoCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id=request.getParameter("userId");
		
		UserDao dao= new UserDao();
		ArrayList<UserDto> userinfo=dao.UserInfo(id);
		request.setAttribute("userinfo",userinfo);

		

	}

}
