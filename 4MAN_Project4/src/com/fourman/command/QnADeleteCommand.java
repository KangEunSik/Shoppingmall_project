package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.QnADao;

public class QnADeleteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bid=Integer.parseInt(request.getParameter("bid"));
		String id=request.getParameter("userid");
		
		QnADao qad= new QnADao();
		int i=qad.qna_delete(id, bid);
		request.setAttribute("qna_delete", i);
	}

}
