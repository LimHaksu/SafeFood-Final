package com.ssafy.dao;

import java.util.List;

import com.ssafy.dto.Reply;

public interface ReplyRepo {
    // public List<Reply> select();

    public List<Reply> select(String item);

    public int insert(Reply r);

    public int update(Reply r);

    public int delete(Reply r);
}
