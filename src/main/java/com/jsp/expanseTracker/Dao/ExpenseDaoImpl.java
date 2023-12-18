package com.jsp.expanseTracker.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jsp.expanseTracker.entity.Expense;
import com.jsp.expanseTracker.utility.SingletonClass;

public class ExpenseDaoImpl implements ExpensesDao{
	
	private Connection connection = SingletonClass.getSingletonClassObject().getConnection();
	private PreparedStatement pstmt;

	@Override
	public int addExpense(Expense expense, int userId) throws Exception {
		String query = "insert into expenses (amount, category, Description, date, userId)" +
						"values(?,?,?,?,?)";
		
		pstmt = connection.prepareStatement(query);
		pstmt.setDouble(1, expense.getAmount());
		pstmt.setString(2, expense.getCategory());
		pstmt.setString(3, expense.getDescription());
		pstmt.setDate(4, expense.getDate());
		pstmt.setInt(5, userId);
		
		int status  = pstmt.executeUpdate();
		if(status != 0) {
			String selectQuery = "select Last_Insert_Id()";
			pstmt = connection.prepareStatement(selectQuery);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.isBeforeFirst()) {
				rs.next();
				int expenseId = rs.getInt(1);
				return expenseId;
			}
		}
		return 0;
	}

	@Override
	public List<Expense> viewExpense(int userId) throws Exception {
		String query = "select * from expenses where userId = ?";
		pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, userId);
		ResultSet rs = pstmt.executeQuery();
		List<Expense> expensesList = new ArrayList<Expense>();
		if(rs.isBeforeFirst()) {
			while (rs.next()) {
				Expense expense = new Expense();
				expense.setAmount(rs.getDouble("amount"));
				expense.setCategory(rs.getString("category"));
				expense.setDate(rs.getDate("date"));
				expense.setDescription(rs.getString("description"));
				//add expenseId
				expense.setExpenseId(rs.getInt("expenseId"));
				expensesList.add(expense);
			}
			return expensesList;
		}
		return null;
	}

	@Override
	public int deleteExpenseById(int expensId) throws Exception {
		String query = "delete from expenses where expenseId = ?";
		pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, expensId);
		int status = pstmt.executeUpdate();
		return status;
	}

	@Override
	public Expense findExpenseById(int expenseId) throws Exception {
		String query = "select * from expenses where expenseId = ?";
		pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, expenseId);
		ResultSet rs = pstmt.executeQuery();
		if(rs.isBeforeFirst()) {
			rs.next();
			Expense expense = new Expense();
			expense.setAmount(rs.getDouble("amount"));
			expense.setCategory(rs.getString("category"));
			expense.setDate(rs.getDate("date"));
			expense.setDescription(rs.getString("description"));
			//add expenseId
			expense.setExpenseId(rs.getInt("expenseId"));
			return expense;
		}
		return null;
	}

	@Override
	public int updateExpense(Expense expense, int expenseId) throws Exception {
		String query = "update expenses set amount=?, description=?, date=?, category=?"+
					   "where expenseId = ?";
		pstmt = connection.prepareStatement(query);
		pstmt.setDouble(1, expense.getAmount());
		pstmt.setString(2, expense.getDescription());
		pstmt.setDate(3, expense.getDate());
		pstmt.setString(4, expense.getCategory());
		pstmt.setInt(5, expenseId);
		
		int status = pstmt.executeUpdate();
		return status;
	}

	@Override
	public List<Expense> totalExpenseList(int userId, Date start, Date end) throws Exception {
		String query = "select * from expenses where date between ? and ?"
				+ " and userId = ?";
		pstmt = connection.prepareStatement(query);
		pstmt.setDate(1, start);
		pstmt.setDate(2, end);
		pstmt.setInt(3, userId);
		ResultSet rs = pstmt.executeQuery();
		List<Expense> expenseList = new ArrayList<Expense>();
		if(rs.isBeforeFirst()) {
			while(rs.next()) {
				Expense expense = new Expense();
				expense.setAmount(rs.getDouble("amount"));
				expense.setCategory(rs.getString("category"));
				expense.setDate(rs.getDate("date"));
				expense.setDescription(rs.getString("description"));
				//add expenseId
				expense.setExpenseId(rs.getInt("expenseId"));
				expenseList.add(expense);
			}
			return expenseList;
		}
		return null;
	}

}














