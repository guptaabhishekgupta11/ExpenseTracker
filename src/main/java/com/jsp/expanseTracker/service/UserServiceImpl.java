package com.jsp.expanseTracker.service;

import java.io.InputStream;

import com.jsp.expanseTracker.Dao.*;

import com.jsp.expanseTracker.entity.User;

public class UserServiceImpl implements UserService{
	private UserDao userdao = new UserDaoImpl(); //upcasting
	@Override
	public int register(User user, String cpassword) {
		if(user.getPassword().equals(cpassword)) {
			try {
				int userId = userdao.register(user);
				System.out.println("Service layer UserId = " + userId);
				return userId;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	@Override
	public User login(String username, String password) {
		try {
			return userdao.login(username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String forgotPassword(String email) {
		/*
		 *  TODO -
		 *  1. call forgotPassword method - UserDao interface
		 *  2. Handle exception
		 *  3. return respective data
		 */
		return null;
	}

	@Override
	public User findByUserId(int userId) {
		try {
			return userdao.findUserById(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int updateProfile(User user, InputStream is) {
		try {
			return userdao.updateUserProfile(user, is);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public byte[] getUserProfileImage(int userId) {
		try {
			return userdao.getUserProfileImage(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}











