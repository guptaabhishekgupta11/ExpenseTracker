package com.jsp.expanseTracker.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	// TODO -Create Ref var of UserService and its Object

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * TODO Auto-generated method stub 1.Fetch email from forgot Password jsp file
		 * 2.call forgotPassword method from UserService interface 3.Perform Servlet
		 * chaining chaining 4.Transfer Data.
		 */
		doGet(request, response);
	}

}
