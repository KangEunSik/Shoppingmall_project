package com.fourman.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.QnADao;
import com.fourman.dto.QnABoardDto;
import com.fourman.dto.QnAPageDto;

public class QnAListCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String page=(String)request.getParameter("page");
		String pageDataCount=(String)request.getParameter("pageDataCount");
		if(page==null) {
			page="1";
		}
		if(pageDataCount==null) {
			pageDataCount="10";
		}
		
		System.out.println(page);
		System.out.println(pageDataCount);
		
		QnADao qnadao= new QnADao();
		ArrayList<QnABoardDto> pageselect=qnadao.pageselect(page, pageDataCount);
		request.setAttribute("pageselect", pageselect);
		int totalDataCount=qnadao.dataCount();
		System.out.println("dd"+totalDataCount);
		QnAPageDto qpd = new QnAPageDto();
		qpd.makePage(Integer.parseInt(page)
				, Integer.parseInt(pageDataCount)
				, totalDataCount);
		request.setAttribute("QnAPageDto", qpd);
	}

}
