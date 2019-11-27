package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Intake;
import com.ssafy.dto.Reply;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IntakeRepoImpl implements IntakeRepo {

    @Autowired
    SqlSession session;

    final String statement = "sql.intake.rest.";

    // @Override
    // public List<Reply> select() {
    // return session.selectList(statement + "select");
    // }

    @Override
    public List<Intake> select(Intake intake) {
        return session.selectList(statement + "select", intake);
    }

    @Override
    public int insert(Intake intake) {
        return session.insert(statement + "insert", intake);
    }

    @Override
    public int delete(Intake intake) {
        return session.delete(statement + "delete", intake);
    }
}
