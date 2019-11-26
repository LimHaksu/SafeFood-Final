package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyRepoImpl implements ReplyRepo {

    @Autowired
    SqlSession session;

    final String statement = "sql.reply.rest.";

    // @Override
    // public List<Reply> select() {
    // return session.selectList(statement + "select");
    // }

    @Override
    public List<Reply> select(String item) {
        return session.selectList(statement + "select", item);
    }

    @Override
    public int insert(Reply r) {
        return session.insert(statement + "insert", r);
    }

    @Override
    public int update(Reply r) {
        return session.update(statement + "update", r);
    }

    @Override
    public int delete(Reply r) {
        return session.delete(statement + "delete", r);
    }
}
