package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Post;

public interface BoardRepo {
	public List<Post> select();
	
	public Post select(String item);
	
	public int insert(Post p);
	
	public int update(Post p);
	
	public int delete(String no);
}
