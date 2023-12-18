package com.jsp.expanseTracker.entity;

//to represent user table - entity class
public class User {

	// to represent columns of user table
	private String username;
	private String fullname;
	private String email;
	private String mobile;
	private String password;
	private int userId;

	public User() {
		super();
	}

	public User(String username, String fullname, String email, String mobile, String password, int userId) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", fullname=" + fullname + ", email=" + email + ", mobile=" + mobile
				+ ", password=" + password + ", userId=" + userId + "]";
	}

}
