package com.fourman.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.QnADao;
import com.fourman.dto.QnABoardDto;

public class QnAWriteCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
			QnABoardDto qbd = new QnABoardDto();
			qbd.setId(request.getParameter("userid"));
			qbd.setBtitle(request.getParameter("btitle"));
			qbd.setBcontent(request.getParameter("bcontent"));
			
			QnADao qdao = new QnADao();
			int i=qdao.qnawrite(qbd);
			request.setAttribute("qnawirte", qbd);
	}

}
