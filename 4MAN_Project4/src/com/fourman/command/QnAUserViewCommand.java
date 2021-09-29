package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fourman.dao.QnADao;
import com.fourman.dto.QnABoardDto;
import com.fourman.dto.QnAPageDto;

public class QnAUserViewCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();

		String id= (String)session.getAttribute("userId");
		String page=(String)request.getParameter("page");
		String pageDataCount=(String)request.getParameter("pageDataCount");
		if(page==null) {
			page="1";
		}
		if(pageDataCount==null) {
			pageDataCount="10";
		}
		QnADao qnadao= new QnADao();
		ArrayList<QnABoardDto> qnauser_view=qnadao.userQnalist(id, page, pageDataCount);
		System.out.println(":"+qnauser_view);
		request.setAttribute("qnauser", qnauser_view);
		int totalDataCount=qnadao.userdataCount(id);
		System.out.println("dd"+totalDataCount);
		QnAPageDto qpd = new QnAPageDto();
		qpd.makePage(Integer.parseInt(page)
				, Integer.parseInt(pageDataCount)
				, totalDataCount);
		request.setAttribute("QnAPageDto", qpd);
	}

}
