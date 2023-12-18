package com.jsp.expanseTracker.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expanseTracker.service.UserService;
import com.jsp.expanseTracker.entity.User;
import com.jsp.expanseTracker.service.UserServiceImpl;

@WebServlet("/Registration")
public class Registration extends HttpServlet {

	private UserService service = new UserServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// fetch data from HTML Form
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String cpassword = request.getParameter("cpassword");

		// Store data in user object
		User user = new User();
		user.setFullname(fullname);
		user.setUsername(username);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);

		// call register method from UserService
		int userId = service.register(user, cpassword);

		// Print output on the browser
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");

		if (userId != 0) {
			//display Login.jsp file
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			//to complete servlet chaining 
			dispatcher.include(request, response);
			writer.print("<h1 style='color:green;'>Registration successfull!!!</h1>");
			writer.print("<h1 style='color:blue;'>Your userID = " + userId + "</h1>");
		} else {
			//display Register.jsp file
			RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
			dispatcher.include(request, response);
			writer.print("<center><h1 style='color:red;'>Please enter valid details</h1></center>");
		}
		
	}

}









