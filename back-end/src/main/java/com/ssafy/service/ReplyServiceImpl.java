package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.ReplyRepo;
import com.ssafy.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyRepo repo;

	// @Override
	// public List<Reply> select() {
	// return repo.select();
	// }

	@Override
	public List<Reply> select(String item) {
		return repo.select(item);
	}

	@Override
	public boolean insert(Reply r) {
		return repo.insert(r) >= 1 ? true : false;
	}

	@Override
	public boolean update(Reply r) {
		return repo.update(r) >= 1 ? true : false;
	}

	@Override
	public boolean delete(Reply r) {
		return repo.delete(r) >= 1 ? true : false;
	}

}
