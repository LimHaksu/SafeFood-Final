package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Reply;

public interface ReplyService {
	// public List<Reply> select();

	public List<Reply> select(String item);

	public boolean insert(Reply r);

	public boolean update(Reply r);

	public boolean delete(Reply r);
}
