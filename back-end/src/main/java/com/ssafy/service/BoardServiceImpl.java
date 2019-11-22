package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.BoardRepo;
import com.ssafy.dto.Post;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardRepo repo;
	
	@Override
	public List<Post> select() {
		return repo.select();
	}

	@Override
	public Post select(String item) {
		return repo.select(item);
	}

	@Override
	public boolean insert(Post p) {
		return repo.insert(p) >= 1 ? true : false;
	}

	@Override
	public boolean update(Post p) {
		return repo.update(p) >= 1 ? true : false;
	}

	@Override
	public boolean delete(String no) {
		return repo.delete(no) >= 1 ? true : false;
	}
	
}
