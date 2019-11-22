package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.dao.FoodDao;
import com.ssafy.dto.Food;

@Service
public class FoodServiceImpl implements FoodService{
//	private String[] allergys={"대두","땅콩","우유","게","새우","참치","연어","쑥","소고기","닭고기","돼지고기","복숭아","민들레","계란흰자"};
	
	@Autowired
	FoodDao dao;

	public Food search(int code) {
		return dao.search(code);
	}
	
	public List<Food> searchAll(String key, String word){
		return dao.searchAll(key, word);
	}
	
	public List<Food> searchBest() {
		return dao.searchBest();
	}
	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}

}
