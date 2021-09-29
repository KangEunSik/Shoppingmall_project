package com.fourman.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fourman.dao.UserDao;

public class IdCheckCommand implements ICommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		UserDao dao = new UserDao();
		String id=request.getParameter("id");
		int result=dao.idcheck(id);
		try {
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복된 아이디')");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('사용가능한 아이디.')");
			script.println("</script>");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	}

}
