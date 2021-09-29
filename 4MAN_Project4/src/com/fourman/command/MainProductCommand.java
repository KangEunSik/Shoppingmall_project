package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.ProductDto;

public class MainProductCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		UserDao dao= new UserDao();
		ArrayList<ProductDto> best=dao.BestProduct();
		request.setAttribute("best", best);
		ArrayList<ProductDto> New=dao.NewProduct();
		request.setAttribute("New", New);
	}

}
