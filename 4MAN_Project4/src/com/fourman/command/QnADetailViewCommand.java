package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.QnADao;
import com.fourman.dto.QnABoardDto;
import com.fourman.dto.QnAPageDto;

public class QnADetailViewCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bid=Integer.parseInt(request.getParameter("bid"));
		
		
		QnADao qnadao= new QnADao();
		ArrayList<QnABoardDto> qnadetail=qnadao.Qnadetail(bid);
		request.setAttribute("qnadetail", qnadetail);
		
		QnAPageDto qpd = new QnAPageDto();
		int currentPageNum=Integer.parseInt(request.getParameter("page"));
		System.out.println("dd"+currentPageNum);
		
		qpd.setCurrentPageNum(currentPageNum);
		int bPageDataCount=Integer.parseInt(request.getParameter("pageDataCount"));
		System.out.println("cc"+bPageDataCount);
		qpd.setPageDataCount(bPageDataCount);
		
		request.setAttribute("QnAPageDto", qpd);
		
	}

}
