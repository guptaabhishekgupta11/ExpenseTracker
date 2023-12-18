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


@WebServlet("/TotalExpense")
public class TotalExpense extends HttpServlet {
	
	private ExpenseService service = new ExpenseServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Date start = Date.valueOf(request.getParameter("start"));
		Date end = Date.valueOf(request.getParameter("end"));
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("userInfo");
		
		List<Expense> totalExpenseList = service.totalExpenseList(user.getUserId(), start, end);
		
		if(totalExpenseList != null) {
			
			request.setAttribute("list", totalExpenseList);
			request.setAttribute("sum", totalExpenseList .stream()
					.mapToDouble(t -> t.getAmount())
					.sum());
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExpense.jsp");
			dispatcher.include(request, response);
		}
		else {
			request.setAttribute("msg", "NO RECORDS FOUND");
			RequestDispatcher dispatcher = request.getRequestDispatcher("ViewExpense.jsp");
			dispatcher.include(request, response);
		}
	}

}














