package com.pga.wallet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Register", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	  String email = request.getParameter("email");
	  long mobile = Long.parseLong(request.getParameter("phone"));
	  String userName = request.getParameter("user");
	  String pwd = request.getParameter("pwd");
	  String firstName = request.getParameter("firstName");
	  
	  User user = new User();
	  user.setEmail(email);
	  user.setFirstName(firstName);
	  user.setMobile(mobile);
	  user.setUser(userName);
	  user.setPwd(pwd);
	  if(UserDao.addUser(user)) {
		  response.sendRedirect("home.jsp");
	  } else {
		  
	  }
	}
}








