package com.fourman.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.fourman.dao.UserDao;



public class LogoutCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			response.setContentType("text/html; charset=utf-8");
			HttpSession session = request.getSession();
			session.invalidate();
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='index.jsp'");
			script.println("alert('로그아웃 되었습니다.')");
			script.println("</script>");
		}catch(Exception e) {
			e.printStackTrace();
		}
		

		

	}

}
