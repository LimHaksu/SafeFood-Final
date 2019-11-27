package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Intake;

public interface IntakeRepo {
    // public List<Reply> select();

    public List<Intake> select(Intake intake);

    public int insert(Intake intake);

    public int delete(Intake intake);
}
