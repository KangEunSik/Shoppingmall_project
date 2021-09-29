package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dto.ProductDto;

public class UpdateProductCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pnum=request.getParameter("pnum");
		
		AdminDao admindao=new AdminDao();
		ArrayList<ProductDto> proinfo=admindao.updateproduct(pnum);
		request.setAttribute("updateproduct", proinfo);
	}

}
