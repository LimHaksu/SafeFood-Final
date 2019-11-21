package com.ssafy.controller;

import java.util.List;

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

import com.ssafy.dto.Post;
import com.ssafy.service.BoardService;

@RestController
@CrossOrigin({"*"})
public class RestAPIController {
	
	@Autowired
	BoardService service;
	
	@GetMapping("/board")
	public ResponseEntity<Object> getBoardList() {
		try {
			List<Post> list = service.select();
            return response(list, HttpStatus.OK);
        } catch (RuntimeException e) {
            throw e;
        }
	}
	
	@GetMapping("/board/{no}")
	public ResponseEntity<Object> getBoardOne(@PathVariable String no) {
		try {
			Post post = service.select(no);
            return response(post, HttpStatus.OK);
        } catch (RuntimeException e) {
            throw e;
        }
	}
	
	@PostMapping("/board")
	public ResponseEntity<Object> insertPost(@RequestBody Post p) {
		try {
			boolean isSuccess = service.insert(p);
            return response(isSuccess, HttpStatus.OK);
        } catch (RuntimeException e) {
        	throw e;
        }
	}
	
	@PutMapping("/board")
	public ResponseEntity<Object> updatePost(@RequestBody Post p) {
		try {
			boolean isSuccess = service.update(p);
            return response(isSuccess, HttpStatus.OK);
        } catch (RuntimeException e) {
        	throw e;
        }
	}
	
	@DeleteMapping("/board/{no}")
	public ResponseEntity<Object> deletePost(@PathVariable String no) {
		try {
			boolean isSuccess = service.delete(no);
            return response(isSuccess, HttpStatus.OK);
        } catch (RuntimeException e) {
        	throw e;
        }
	}
	
	private ResponseEntity<Object> response(Object data, HttpStatus status) {
        return new ResponseEntity<Object>(data, status);
    }
}
