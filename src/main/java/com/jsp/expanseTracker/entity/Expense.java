package com.jsp.expanseTracker.entity;

import java.sql.Date;

public class Expense {

	private double amount;
	private String category;
	private String Description;
	private Date date;
	private int expenseId;

	public Expense() {
		super();
	}

	public Expense(double amount, String category, String description, Date date, int expenseId) {
		super();
		this.amount = amount;
		this.category = category;
		Description = description;
		this.date = date;
		this.expenseId = expenseId;
	}

	public int getExpenseId() {
		return expenseId;
	}

	public void setExpenseId(int expenseId) {
		this.expenseId = expenseId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Expense [amount=" + amount + ", category=" + category + ", Description=" + Description + ", date="
				+ date + ", expenseId=" + expenseId + "]";
	}

}
