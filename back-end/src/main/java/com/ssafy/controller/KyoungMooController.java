package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ssafy.dto.Food;
import com.ssafy.dto.FriendInfo;
import com.ssafy.dto.Intake;
import com.ssafy.dto.Post;
import com.ssafy.dto.Reply;
import com.ssafy.dto.User;
import com.ssafy.service.BoardService;
import com.ssafy.service.FoodService;
import com.ssafy.service.IntakeService;
import com.ssafy.service.ReplyService;
import com.ssafy.service.UserService;
import com.ssafy.util.HashUtil;

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

@CrossOrigin(origins = { "*" })
@RestController
public class KyoungMooController {

	@Autowired
	private FoodService foodService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private IntakeService intakeService;

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

	@GetMapping("food/{code}")
	public Food getFood(@PathVariable int code) {
		Food food = foodService.search(code);
		return food;
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
			List<Reply> reply_list = replyService.select(no);
			Map<String, Object> map = new HashMap<>();
			map.put("post", post);
			map.put("reply_list", reply_list);
			return response(map, HttpStatus.OK);
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

	/******************************************************************************** */

	@PostMapping("/reply")
	public ResponseEntity<Object> insertReply(@RequestBody Reply r) {
		try {
			System.out.println("시도");
			boolean isSuccess = replyService.insert(r);
			System.out.println("성공");
			return response(isSuccess, HttpStatus.OK);
		} catch (RuntimeException e) {
			System.out.println("실패");
			throw e;
		}
	}

	@PutMapping("/reply")
	public ResponseEntity<Object> updateReply(@RequestBody Reply r) {
		try {
			boolean isSuccess = replyService.update(r);
			return response(isSuccess, HttpStatus.OK);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	@DeleteMapping("/reply/{no}/{writer}")
	public ResponseEntity<Object> deleteReply(@PathVariable Integer no, @PathVariable String writer) {
		try {
			Reply r = new Reply(no, writer, "");
			boolean isSuccess = replyService.delete(r);
			return response(isSuccess, HttpStatus.OK);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/*****************************************************************************/

	@GetMapping("/intake/{id}/{date}")
	public ResponseEntity<Object> getIntake(@PathVariable String id, @PathVariable String date) {
		try {
			Intake intake = new Intake(id, date, 0);
			List<Intake> intake_list = intakeService.select(intake);
			return response(intake_list, HttpStatus.OK);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	@PostMapping("/intake")
	public ResponseEntity<Object> insertIntake(@RequestBody Intake intake) {
		try {
			System.out.println("시도");
			boolean isSuccess = intakeService.insert(intake);
			System.out.println("성공");
			return response(isSuccess, HttpStatus.OK);
		} catch (RuntimeException e) {
			System.out.println("실패");
			throw e;
		}
	}

	@DeleteMapping("/intake/{id}/{date}/{code}")
	public ResponseEntity<Object> deleteReply(@PathVariable String id, @PathVariable String date,
			@PathVariable Integer code) {
		try {
			Intake intake = new Intake(id, date, code);
			boolean isSuccess = intakeService.delete(intake);
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
	public ResponseEntity<Object> update(@RequestBody User user) {
		// 1. parameter 검증
		String hashPass = String.valueOf(HashUtil.hash(user.getPassword()));

		user.setPassword(hashPass);

		userService.updateUser(user);

		/* TODO: 아직 무엇을 넘길지 정하지 못함 */
		return response(true, HttpStatus.OK);
	}

	// delete.do -> user
	@DeleteMapping("user/{userid}")
	public ResponseEntity<Object> doDelete(@PathVariable String userid) {
		User user = userService.findUser(userid);
		userService.deleteUser(user);

		return response(true, HttpStatus.OK);
	}

	@PostMapping("friend")
	public ResponseEntity<Object> addFriend(@RequestBody FriendInfo info) {
		System.out.println(info.getOwnerId() + ", " + info.getFriendId());
		User user = userService.findUser(info.getOwnerId());

		System.out.println("user : " + user);

		if (info.getOwnerId().equals(info.getFriendId())) {
			return response(false, HttpStatus.FOUND);
		}

		if (user.getFriend() != null) {
			String[] friends = user.getFriend().split(",");

			for (String f : friends) {
				if (f.equals(info.getFriendId())) {
					// 이미 있는지 체크
					return response(false, HttpStatus.FOUND);
				}
			}

			// 없으면 추가
			user.setFriend(user.getFriend() + "," + info.getFriendId());
		} else {
			user.setFriend(info.getFriendId());
		}

		// db에 friend가 있을까?
		User search = userService.findUser(info.getFriendId());

		System.out.println("after user : " + user);
		System.out.println("search : " + search);

		if (search == null) {
			return response(false, HttpStatus.BAD_REQUEST);
		} else {
			userService.addFriend(user);
			return response(true, HttpStatus.OK);
		}
	}

	@GetMapping("friend/{ownerId}")
	public ResponseEntity<Object> getFriendList(@PathVariable String ownerId) {
		User user = userService.findUser(ownerId);

		String[] friends = user.getFriend().split(",");

		return response(friends, HttpStatus.OK);
	}

	private ResponseEntity<Object> response(Object data, HttpStatus status) {
		return new ResponseEntity<Object>(data, status);
	}
}
