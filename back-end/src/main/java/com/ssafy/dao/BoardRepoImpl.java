package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Post;

@Repository
public class BoardRepoImpl implements BoardRepo {

	@Autowired
	SqlSession session;

	final String statement = "sql.board.rest.";

	@Override
	public List<Post> select() {
		return session.selectList(statement + "select");
	}

	@Override
	public Post select(String item) {
		return session.selectOne(statement + "select", item);
	}

	@Override
	public int insert(Post p) {
		return session.insert(statement + "insert", p);
	}

	@Override
	public int update(Post p) {
		return session.update(statement + "update", p);
	}

	@Override
	public int delete(String no) {
		return session.delete(statement + "delete", no);
	}
}
