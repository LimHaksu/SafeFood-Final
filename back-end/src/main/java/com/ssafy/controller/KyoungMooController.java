package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Food;
import com.ssafy.dto.Post;
import com.ssafy.service.BoardService;
import com.ssafy.service.FoodService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
public class KyoungMooController {

	@Autowired
	private FoodService foodService;
	
	@Autowired
	private BoardService boardService;

	@GetMapping("foodlist.do")
	public Map<String, Object> getFoods() {
		List<Food> list = null;

		Map<String, Object> map = new HashMap<>();
		list = foodService.searchAll("", "");
		map.put("list", list);
		return map;
	}

	@GetMapping("search.do/{key}/{word}")
	public Map<String, Object> Eldyd(@PathVariable String key, @PathVariable String word) {
		List<Food> list = null;
		if(word.equals("*")) {word="";}
		Map<String, Object> map = new HashMap<>();
		list = foodService.searchAll(key, word);
		map.put("list", list);
		
		return map;
	}
	
	/***************************************************************************************/
	
	@GetMapping("/board")
	public ResponseEntity<Object> getBoardList() {
		try {
			List<Post> list = boardService.select();
            return response(list, HttpStatus.OK);
        } catch (RuntimeException e) {
            throw e;
        }
	}
	
	@GetMapping("/board/{no}")
	public ResponseEntity<Object> getBoardOne(@PathVariable String no) {
		try {
			Post post = boardService.select(no);
            return response(post, HttpStatus.OK);
        } catch (RuntimeException e) {
            throw e;
        }
	}
	
	@PostMapping("/board")
	public ResponseEntity<Object> insertPost(@RequestBody Post p) {
		try {
			boolean isSuccess = boardService.insert(p);
            return response(isSuccess, HttpStatus.OK);
        } catch (RuntimeException e) {
        	throw e;
        }
	}
	
	@PutMapping("/board")
	public ResponseEntity<Object> updatePost(@RequestBody Post p) {
		try {
			boolean isSuccess = boardService.update(p);
            return response(isSuccess, HttpStatus.OK);
        } catch (RuntimeException e) {
        	throw e;
        }
	}
	
	@DeleteMapping("/board/{no}")
	public ResponseEntity<Object> deletePost(@PathVariable String no) {
		try {
			boolean isSuccess = boardService.delete(no);
            return response(isSuccess, HttpStatus.OK);
        } catch (RuntimeException e) {
        	throw e;
        }
	}
	
	private ResponseEntity<Object> response(Object data, HttpStatus status) {
        return new ResponseEntity<Object>(data, status);
    }
}
