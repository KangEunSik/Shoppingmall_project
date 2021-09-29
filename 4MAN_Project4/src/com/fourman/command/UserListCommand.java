package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dto.UserDto;

public class UserListCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		AdminDao admindao=new AdminDao();
		ArrayList<UserDto> userlist=admindao.userList();
		request.setAttribute("userList", userlist);
	}

}
