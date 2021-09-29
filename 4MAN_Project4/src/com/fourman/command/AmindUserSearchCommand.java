package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dao.ProductDao;
import com.fourman.dao.UserDao;
import com.fourman.dto.ProductDto;
import com.fourman.dto.UserDto;

public class AmindUserSearchCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		AdminDao admindao=new AdminDao();
		String id = request.getParameter("serach");
		String name = request.getParameter("serach");
		ArrayList<UserDto> amdin_user_search=admindao.search_user(id, name);
		request.setAttribute("search_user", amdin_user_search);
	}

}
