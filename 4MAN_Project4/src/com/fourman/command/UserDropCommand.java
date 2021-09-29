package com.fourman.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fourman.dao.UserDao;

public class UserDropCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html; charset=utf-8");
			String id = request.getParameter("userid");
			String userName = request.getParameter("name");
			String pw = request.getParameter("userpw");
			String pw2 = request.getParameter("pwCheck");
			
			UserDao dao = new UserDao();
			int result=dao.DeleteUser(pw, userName, id);
			if(result==0||id.equals("")||userName.equals("") || pw.equals("")|| !(pw.equals(pw2))) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력사항을 확인해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				HttpSession session = request.getSession();
				session.invalidate();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원탈퇴 되었습니다.')");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
