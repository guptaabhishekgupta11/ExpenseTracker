package com.jsp.expanseTracker.servlets;

import java.io.IOException;
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

@WebServlet("/UpdateExpense")
public class UpdateExpense extends HttpServlet {
	private ExpenseService service = new ExpenseServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Fetch expenseId
		int expenseId = Integer.parseInt(request.getParameter("eId"));
		
		//Fetch expense Information - amount, date, category, description
		//Store all expense info in Expense object
		Expense expense = new Expense();
		expense.setAmount(Double.parseDouble(request.getParameter("amount")));
		expense.setCategory(request.getParameter("category"));
		expense.setDescription(request.getParameter("description"));
		expense.setDate(Date.valueOf(request.getParameter("date")));
		
		//Call updateExpense Method
		int status = service.updateExpense(expense, expenseId);
		
		//return 1 - then display ViewExpense.jsp
		//return 0 - then display UpdateExpense.jsp
		if(status != 0) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("userInfo");
			List<Expense> expenses = service.viewExpense(user.getUserId());
			request.setAttribute("list", expenses);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExpense.jsp");
			dispatcher.include(request, response);
		}
		else {
			request.setAttribute("msg", "PLEASE ENTER VLAID DETAILS");
			RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateExpense.jsp");
			dispatcher.include(request, response);
		}
	}


}






