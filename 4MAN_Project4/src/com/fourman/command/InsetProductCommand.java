package com.fourman.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dto.ProductDto;



public class InsetProductCommand implements ICommand {
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ProductDto dto = new ProductDto();
		dto.setPNum(request.getParameter("pnum"));
		dto.setPname(request.getParameter("pname"));
		dto.setPkind(request.getParameter("pkind"));
		dto.setPprice(Integer.parseInt(request.getParameter("pprice")));
		dto.setPContent(request.getParameter("pcontent"));
		dto.setPimage(request.getParameter("pimage"));
		dto.setPbest(request.getParameter("pbest"));
		
		
		AdminDao dao = new AdminDao();
		int i=dao.insert(dto);
		request.setAttribute("dto", dto);
	
	}

}
