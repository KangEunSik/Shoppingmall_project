package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;

public class DeleteProductCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pnum=request.getParameter("pnum");
		
		AdminDao delete_product=new AdminDao();
		int i=delete_product.deleteproduct(pnum);
		request.setAttribute("delete", delete_product);
	}

}
