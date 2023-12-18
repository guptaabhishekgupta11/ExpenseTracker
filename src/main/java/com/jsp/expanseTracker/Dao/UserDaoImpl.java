package com.jsp.expanseTracker.Dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jsp.expanseTracker.entity.User;
import com.jsp.expanseTracker.utility.SingletonClass;


public class UserDaoImpl implements UserDao {

	// Establish Connection
	private Connection connect = SingletonClass.getSingletonClassObject().getConnection();
	// Create platform
	private PreparedStatement pstmt;

	@Override
	public int register(User user) throws Exception {
		// insert query - to insert data in user table
		String insert = "insert into user" 
		+ "(username, fullname, email, mobile, password)"
		+ "values(?, ?, ?, ?, ?)";

		pstmt = connect.prepareStatement(insert);
		
//      set values for placeholder - take values from user object
//		String username = user.getUsername();
//		pstmt.setString(1, username);
		pstmt.setString(1, user.getUsername());
		pstmt.setString(2, user.getFullname());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getMobile());
		pstmt.setString(5, user.getPassword());

		// execute insert query
		int status = pstmt.executeUpdate();
		System.out.println("Status of Insert query = " + status);
		if (status != 0) {
			// retrieve userId from db
			String select = "select userId from user where email = ?";
			pstmt = connect.prepareStatement(select);
			pstmt.setString(1, user.getEmail());
			ResultSet rs = pstmt.executeQuery();
			if (rs.isBeforeFirst()) {
				rs.next();
				System.out.println("UserId = " + rs.getInt("userId"));
				return rs.getInt("userId");
			}
		}
		// return user id to the method
		return 0;
	}

	@Override
	public User login(String username, String password) throws Exception {
		String query = "select * from user where username = ? and password = ?";
		pstmt = connect.prepareStatement(query);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		if(rs.isBeforeFirst()) {
			rs.next();
			
			String un = rs.getString("username");
			String email = rs.getString("email");
			String mobile = rs.getString("mobile");
			String fullname = rs.getString("fullname");
			String pwd = rs.getString("password");
			int id = rs.getInt("userId"); //change1
			
			User user = new User();
			user.setEmail(email);
			user.setFullname(fullname);
			user.setMobile(mobile);
			user.setPassword(pwd);
			user.setUsername(un);
			user.setUserId(id); //change2
			
			return user;
		}
		return null;
	}

	@Override
	public String forgotPassword(String email) throws Exception {
		/*
		 *  TODO -
		 *  1. Write a query - select query to fetch password from db
		 *  2. Create a platform
		 *  3. Assign value for placeholder
		 *  4. Execute select query
		 *  5. return respective data
		 */
		return null;
	}

	@Override
	public User findUserById(int id) throws Exception {
		String query = "select * from user where userId = ?";
		pstmt = connect.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.isBeforeFirst()) {
			rs.next();
			
			//fetch data from database
			//store data in user object
			User user = new User();
			user.setEmail(rs.getString("email"));
			user.setFullname(rs.getString("fullName"));
			user.setMobile(rs.getString("mobile"));
			user.setPassword(rs.getString("password"));
			user.setUsername(rs.getString("username"));
			
			user.setUserId(rs.getInt("userId"));
			
			return user;
		}
		return null;
	}

	@Override
	public int updateUserProfile(User user, InputStream is) throws Exception{
		String query = "update user set fullname =?, username=?, mobile=?, email=?, "+
						"password=?, image=? where userId = ?";
		pstmt = connect.prepareStatement(query);
		pstmt.setString(1, user.getFullname());
		pstmt.setString(2, user.getUsername());
		pstmt.setString(3, user.getMobile());
		pstmt.setString(4, user.getEmail());
		pstmt.setString(5, user.getPassword());
		pstmt.setBlob(6, is);
		pstmt.setInt(7, user.getUserId());
		
		int status = pstmt.executeUpdate();
		return status;
	}

	@Override
	public byte[] getUserProfileImage(int userId) throws Exception {
		String query = "select * from user where userId = ?";
		pstmt = connect.prepareStatement(query);
		pstmt.setInt(1, userId);
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.isBeforeFirst()) {
			rs.next();
			Blob blob = rs.getBlob("image");
			if(blob != null) {
			byte byteArray[] = blob.getBytes(1, (int)blob.length());
			return byteArray;
			}
		}
		return null;
	}

}













