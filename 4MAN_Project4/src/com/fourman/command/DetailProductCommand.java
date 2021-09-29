package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;
import com.fourman.dto.ProductDto;

public class DetailProductCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pnum=request.getParameter("Pnum");
		UserDao dao= new UserDao();
		ArrayList<ProductDto> detail=dao.detailProduct(pnum);
		request.setAttribute("detail", detail);
	}

}
