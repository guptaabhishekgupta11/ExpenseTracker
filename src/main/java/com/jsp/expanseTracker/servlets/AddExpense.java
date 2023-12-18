package com.jsp.expanseTracker.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.expanseTracker.entity.Expense;
import com.jsp.expanseTracker.entity.User;
import com.jsp.expanseTracker.service.ExpenseService;
import com.jsp.expanseTracker.service.ExpenseServiceImpl;

@WebServlet("/AddExpense")
public class AddExpense extends HttpServlet {
	
	private ExpenseService expenseService = new ExpenseServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Fetch data from HTML form and store in Expense object
		Expense expense = new Expense();
		expense.setAmount(Double.parseDouble(request.getParameter("amount")));
		expense.setDescription(request.getParameter("description"));
		expense.setDate(Date.valueOf(request.getParameter("date")));
		expense.setCategory(request.getParameter("category"));
		
		//TODO : get userId of an user, who logged in an application.
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userInfo");
		
		int expenseId = expenseService.addExpense(expense, user.getUserId());
		
//		PrintWriter writer = response.getWriter();
//		writer.print("<h1>Expense Added Successfully, ExpenseId = " + expenseId+"</h1>");
		
		if(expenseId != 0) {
			List<Expense> viewExpense = expenseService.viewExpense(user.getUserId());
			request.setAttribute("list", viewExpense);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewExpenses.jsp");
			requestDispatcher.include(request, response);
		}
		else {
			request.setAttribute("msg", "PLEASE ENTER VALID DETAILS");
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("addExpenses.jsp");
			requestDispatcher.include(request, response);
		}
	}
}















