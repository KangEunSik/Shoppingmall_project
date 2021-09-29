package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dto.ProductDto;


public class SelectProductCommand implements ICommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		AdminDao dao= new AdminDao();
		ArrayList<ProductDto> pdtos=dao.selectproduct();
		request.setAttribute("pdtos", pdtos);
		
	
		
	}
	

}
