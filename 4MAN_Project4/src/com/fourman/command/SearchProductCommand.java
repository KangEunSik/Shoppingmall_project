package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.command.ICommand;
import com.fourman.dao.AdminDao;
import com.fourman.dao.ProductDao;
import com.fourman.dto.ProductDto;


public class SearchProductCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductDao dao=new ProductDao();
		String pname = request.getParameter("searchname");
		ArrayList<ProductDto> search=dao.SearchProduct(pname);
		request.setAttribute("search", search);
	}
 

}
