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
import com.ssafy.dto.User;
import com.ssafy.service.BoardService;
import com.ssafy.service.FoodService;
import com.ssafy.service.UserService;
import com.ssafy.util.HashUtil;

@CrossOrigin(origins = { "*" })
@RestController
public class KyoungMooController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;

	@GetMapping("foodlist")
	public Map<String, Object> getFoods() {
		List<Food> list = null;

		Map<String, Object> map = new HashMap<>();
		list = foodService.searchAll("", "");
		map.put("list", list);
		return map;
	}

	@GetMapping("foodlist/{key}/{word}")
	public Map<String, Object> Eldyd(@PathVariable String key, @PathVariable String word) {
		List<Food> list = null;
		if (word.equals("*")) {
			word = "";
		}
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

	/*****************************************************************************/

	// login -> ??
	@PostMapping("/login")
	public ResponseEntity<Object> doLogin(@RequestBody User user) {
		// 1. parameter 검증
		String hashPassword = String.valueOf(HashUtil.hash(user.getPassword()));
		System.out.println("해시 패스워드 : " + hashPassword);
		// 2. 모델 연결(생략 --> id=ssafy, pass=1111)
		User result = userService.login(user.getId(), hashPassword);

		// 3. view 연결
		if (result == null) {
			return response(null, HttpStatus.BAD_REQUEST);
		} else {
			// 성공적으로 로그인 했다면..
			return response(result, HttpStatus.OK);
		}
	}

	// insert.do -> user
	@PostMapping("/user")
	public ResponseEntity<Object> doSignUp(@RequestBody User user) {
		// 2. 비밀번호 해시
		int hashPassword = HashUtil.hash(user.getPassword());
		user.setPassword(String.valueOf(hashPassword));

		// 3. view 연결
		/* TODO: 아직 무엇을 넘길지 정하지 못함 */
		try {
			userService.insertUser(user);
			return response(user, HttpStatus.OK);
		} catch (Exception e) {
			return response(e, HttpStatus.CONFLICT);
		}
	}

	// update.do -> user
	@PutMapping("/user")
	public ResponseEntity<Object> update(User user) {
		// 1. parameter 검증
		String hashPass = String.valueOf(HashUtil.hash(user.getPassword()));

		user.setPassword(hashPass);

		userService.updateUser(user);

		/* TODO: 아직 무엇을 넘길지 정하지 못함 */
		return response(true, HttpStatus.OK);
	}

	// delete.do -> user
	@DeleteMapping("user")
	public ResponseEntity<Object> doDelete(String userid) {
		User user = userService.findUser(userid);
		userService.deleteUser(user);

		// TODO: 세션 초기화 하자
		// session.invalidate();
		return response(true, HttpStatus.OK);
	}

	private ResponseEntity<Object> response(Object data, HttpStatus status) {
		return new ResponseEntity<Object>(data, status);
	}
}
