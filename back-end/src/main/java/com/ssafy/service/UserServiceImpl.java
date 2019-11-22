package com.ssafy.service;

import com.ssafy.dao.UserDao;
import com.ssafy.dto.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao udao;
	
	@Override
	public void insertUser(User user) {
		udao.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		udao.updateUser(user);
	}

	@Override
	public void deleteUser(User user) {
		udao.deleteUser(user);
	}

	@Override
	public User findUser(String id) {
		return udao.findUser(id);
	}

	@Override
	public User login(String id, String pw) {
		User user = udao.findUser(id);
		System.out.println(user);
		if(user == null || pw == null) {
			return null;
		}
		if(pw.equals(user.getPassword())) {
			return user;
		}else {
			return null;
		}
	}

}
