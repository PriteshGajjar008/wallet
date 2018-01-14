package com.pga.wallet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToWalletServlet
 */
@WebServlet("/add-to-wallet")
public class AddToWalletServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 HttpSession session = request.getSession();
	 User user = (User)session.getAttribute("USER");
	 String name = user.getUser();
	 float amt = Float.parseFloat(request.getParameter("amt"));
	 AccountDao.addToWallet(name, amt);
	 float bal = AccountDao.getBalance(name);
	 response.getWriter().write(""+bal);
	}

}










