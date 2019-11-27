package com.ssafy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.User;

@Repository
public class UserDaoImpl implements UserDao {
	private final String ns = "com.ssafy.model.UserMapper.";

	@Autowired
	SqlSession session;

	@Override
	public void insertUser(User user) {
		session.insert(ns + "insertUser", user);
	}

	@Override
	public void updateUser(User user) {
		session.update(ns + "updateUser", user);
	}

	@Override
	public void deleteUser(User user) {
		session.delete(ns + "deleteUser", user);
	}

	@Override
	public User findUser(String id) {
		return session.selectOne(ns + "findUser", id);
	}

	@Override
	public int addFriend(User user) {
		return session.update(ns + "addFriend", user);
	}

}
