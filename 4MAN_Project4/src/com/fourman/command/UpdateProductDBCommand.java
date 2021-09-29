package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.AdminDao;

public class UpdateProductDBCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pnum=request.getParameter("pnum");
		String pname=request.getParameter("pname");
		String pkind=request.getParameter("pkind");
		int pprice=Integer.parseInt(request.getParameter("pprice"));
		String pcontent=request.getParameter("pcontent");
		String pimage=request.getParameter("pimage");
		String pbest=request.getParameter("pbest");
		
		AdminDao admindao=new AdminDao();
		int i =admindao.updateprdouct(pnum, pname, pkind, pprice, pcontent, pimage, pbest);
		request.setAttribute("updateprdouct", i);
		
	}

}
