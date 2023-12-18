package com.jsp.expanseTracker.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.expanseTracker.entity.User;
import com.jsp.expanseTracker.service.ExpenseService;
import com.jsp.expanseTracker.service.ExpenseServiceImpl;

@WebServlet("/DeleteExpense")
public class DeleteExpense extends HttpServlet {
	
	private ExpenseService service = new ExpenseServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Fetch Data from URL
		String temp = request.getParameter("expenseId");
		int expenseId = Integer.parseInt(temp);
		
		int status = service.deleteExpense(expenseId);
		
		if(status != 0) {
			HttpSession session = request.getSession();
			User user =(User)session.getAttribute("userInfo");
			request.setAttribute("list", service.viewExpense(user.getUserId()));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExpense.jsp");
			dispatcher.include(request, response);
		}
	}

}











