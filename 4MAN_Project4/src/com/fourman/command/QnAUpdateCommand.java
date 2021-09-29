package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.QnADao;

public class QnAUpdateCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
			int bid=Integer.parseInt(request.getParameter("bid"));
			String id=request.getParameter("userid");
			String title=request.getParameter("btitle");
			String content=request.getParameter("bcontent");
			
			QnADao qad= new QnADao();
			int i=qad.qna_update(id, bid, title, content);
			request.setAttribute("qna_update", i);
	}

}
