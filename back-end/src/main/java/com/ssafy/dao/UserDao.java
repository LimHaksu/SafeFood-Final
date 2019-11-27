package com.ssafy.dao;

import com.ssafy.dto.User;

public interface UserDao {
	public void insertUser(User user);

	public void updateUser(User user);

	public void deleteUser(User user);

	public User findUser(String id);

	public int addFriend(User user);
}
