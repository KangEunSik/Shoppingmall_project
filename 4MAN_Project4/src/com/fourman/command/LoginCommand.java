package com.fourman.command;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.fourman.dao.AdminDao;
import com.fourman.dao.UserDao;
import com.fourman.dto.AdminLogin;



public class LoginCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html; charset=utf-8");
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			System.out.println("id : "+userid);
			System.out.println("pw : "+userpw);
			
			String userID = null;
			if(session.getAttribute("userId") != null) {
				userID = (String) session.getAttribute("userId");
			}
			if(userID!=null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index.jsp'");
				script.println("alert('이미 로그인 중 입니다.')");
				script.println("</script>");
			}
			
			
			UserDao dao = new UserDao();
			int result=dao.logIn(userid, userpw);
			
			if (result == 1) {
				
				session.setAttribute("userId", userid);
				
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index.do'");
				script.println("alert('로그인 성공')");
				script.println("</script>");
			}
			else if (result == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호를 확인해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력하지 않았거나 없는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		

		

	}

}
