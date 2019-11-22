package com.ssafy.service;

import com.ssafy.dto.User;

public interface UserService {
	public void insertUser(User user);
	
	public void updateUser(User user);
	
	public void deleteUser(User user);
	
	public User findUser(String id) ;
	
	public User login(String id, String pw);
	
}
