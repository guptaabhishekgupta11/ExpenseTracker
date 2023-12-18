package com.jsp.expanseTracker.Dao;
import java.io.InputStream;

import com.jsp.expanseTracker.entity.User;
//all database operation on User table
//Data Access Object
public interface UserDao {

	//void register(String username, String fullname, String mobile, String email, String password);
	int register(User user) throws Exception; //return id of user after inserting data

	User login(String username, String password) throws Exception;
	
	String forgotPassword(String email) throws Exception;
	
	User findUserById(int id) throws Exception;
	
	int updateUserProfile(User user, InputStream is) throws Exception;
	
	byte[] getUserProfileImage(int userId) throws Exception;
}
















