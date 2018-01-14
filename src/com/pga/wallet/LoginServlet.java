package com.pga.wallet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/validate")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		if(UserDao.isValidUser(user, pwd)) {
			HttpSession session = request.getSession();
			User currentUser = UserDao.getUser(user);
			session.setAttribute("USER",currentUser);
			response.sendRedirect("wallet.jsp");
		} else {
			response.sendRedirect("home.jsp?validate=false");
		}
	}

}
