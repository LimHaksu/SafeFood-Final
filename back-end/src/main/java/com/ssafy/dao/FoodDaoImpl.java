package com.ssafy.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.dto.Food;

@Repository
public class FoodDaoImpl implements FoodDao {

	private final String ns = "com.ssafy.model.FoodMapper.";

	@Autowired
	SqlSession session;
	
	@Override
	public Food search(int code) {
		return session.selectOne(ns + "search", code);
	}

	@Override
	public List<Food> searchAll(String key, String word) {
		System.out.println("들어옴");
		Map<String, String> map = new HashMap<>();
		List<Food> list = new ArrayList<Food>();
		if(word.equals("")) {
			list =  session.selectList(ns + "searchAll");
			return list;
		}
		String parameter = "%" +  word + "%";
		if(key.equals("name")) {
			list = session.selectList(ns + "searchAllName", parameter);
		}else if(key.equals("maker")) {
			list = session.selectList(ns + "searchAllMaker", parameter);
		}else if(key.equals("material")) {
			list = session.selectList(ns + "searchAllMaterial", parameter);
		}
		return list;
	}

	@Override
	public void loadData() throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Food> searchBest() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Food> searchBestIndex() {
		// TODO Auto-generated method stub
		return null;
	}

}
