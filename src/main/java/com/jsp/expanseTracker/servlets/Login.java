package com.jsp.expanseTracker.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.expanseTracker.entity.User;
import com.jsp.expanseTracker.service.UserService;
import com.jsp.expanseTracker.service.UserServiceImpl;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private UserService userService = new UserServiceImpl();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//fetch data from login page
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = userService.login(username, password);
		
		//Access session object
		HttpSession session = request.getSession();
		System.out.println(session);
		if(user != null) {
			//credentials are valid - show home page
			//to transfer data
			
			//request.setAttribute("userInfo", user);
			//transfer data with help of session
			session.setAttribute("userInfo", user);
			//request.setAttribute("msg", "LOGIN SUCCESSFULL!!");
			
//			RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
//			dispatcher.include(request, response);
			response.sendRedirect("home.jsp");
			//writer.print("Login successfull");
		}
		else {
			
			//credentials are invalid - show login page
			request.setAttribute("msg", "PLEASE VALID CREDENTAILS...");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.include(request, response);
			//writer.print("Invalid credentails");
		}
	}

}










