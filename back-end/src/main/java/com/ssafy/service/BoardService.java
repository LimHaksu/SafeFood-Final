package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Post;

public interface BoardService {
	public List<Post> select();
	
	public Post select(String item);
	
	public boolean insert(Post p);
	
	public boolean update(Post p);
	
	public boolean delete(String no);
}
