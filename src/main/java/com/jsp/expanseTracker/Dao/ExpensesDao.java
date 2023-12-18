package com.jsp.expanseTracker.Dao;
import java.sql.Date;
import java.util.List;

import com.jsp.expanseTracker.entity.Expense;
//all database operation on expense table
public interface ExpensesDao {
	int addExpense(Expense expense, int userId) throws Exception;
	
	List<Expense> viewExpense(int userId) throws Exception;
	
	int deleteExpenseById(int expensId) throws Exception;
	
	Expense findExpenseById(int expenseId) throws Exception;
	
	int updateExpense(Expense expense, int expenseId) throws Exception;
	
	List<Expense> totalExpenseList(int userId, Date start, Date end) throws Exception;
	
}







