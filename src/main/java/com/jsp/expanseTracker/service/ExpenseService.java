package com.jsp.expanseTracker.service;
import java.sql.Date;
import java.util.List;

import com.jsp.expanseTracker.entity.Expense;
public interface ExpenseService {
	int addExpense(Expense expense, int userId);
	
	List<Expense> viewExpense(int userId);
	
	int deleteExpense(int expenseId);
	
	Expense findExpenseById(int expenseId);
	
	int updateExpense(Expense expense, int expenseId);
	
	List<Expense> totalExpenseList(int userId, Date start, Date end);
	
	List<Expense> filterExpenseByCategory(String category, int userId);
	
	List<Expense> filterExpenseByAmountRange(int start, int end, int userId);
}
