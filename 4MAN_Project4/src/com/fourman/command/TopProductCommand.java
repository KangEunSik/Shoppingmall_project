package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.ProductDto;

public class TopProductCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		UserDao dao= new UserDao();
		ArrayList<ProductDto> Top=dao.TopProduct();
		request.setAttribute("Top", Top);
	}

}
