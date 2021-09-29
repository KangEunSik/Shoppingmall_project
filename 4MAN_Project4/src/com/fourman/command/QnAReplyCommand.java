package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.QnADao;

public class QnAReplyCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		QnADao qad=new QnADao();
		
		String bId=request.getParameter("bid");
		String bGroup=request.getParameter("bgroup");
		String bIndent=request.getParameter("bindent");
		String bStep=request.getParameter("bstep");
		
		
		String id=request.getParameter("userid");
		String bTitle=request.getParameter("btitle");
		String bContent=request.getParameter("bcontent");
		
		qad.reply(bId, bGroup, bIndent, bStep, id, bTitle, bContent);
	}

}
