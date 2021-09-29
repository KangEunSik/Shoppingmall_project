package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;
import com.fourman.dto.OrderDto;
import com.fourman.dto.ProductDto;

public class AmindOrderListCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		AdminDao dao= new AdminDao();
		ArrayList<OrderDto> listorder=dao.list_order();
		request.setAttribute("listorder", listorder);
	}

}
