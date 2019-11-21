package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Food;
import com.ssafy.service.FoodService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
public class KyoungMooController {

	@Autowired
	private FoodService service;

	@GetMapping("foodlist.do")
	public Map<String, Object> getFoods() {
		List<Food> list = null;

		Map<String, Object> map = new HashMap<>();
		list = service.searchAll("", "");
		map.put("list", list);
		return map;
	}

	@GetMapping("search.do/{key}/{word}")
	public Map<String, Object> Eldyd(@PathVariable String key, @PathVariable String word) {
		List<Food> list = null;
		if(word.equals("*")) {word="";}
		Map<String, Object> map = new HashMap<>();
		list = service.searchAll(key, word);
		map.put("list", list);
		
		return map;
	}
}
