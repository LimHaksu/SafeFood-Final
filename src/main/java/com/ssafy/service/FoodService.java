package com.ssafy.service;

import java.util.List;

import com.ssafy.dto.Food;

public interface FoodService {
	
	public List<Food> searchAll(String key2, String word2);
	public Food search(int code);

	public List<Food> searchBest();
	public List<Food> searchBestIndex();	
}
