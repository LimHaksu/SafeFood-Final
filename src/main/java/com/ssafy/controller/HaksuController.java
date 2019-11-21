package com.ssafy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.dto.User;
import com.ssafy.service.UserService;
import com.ssafy.util.HashUtil;

@Controller
public class HaksuController {

	@Autowired
	UserService userService;

	@GetMapping("main.do")
	public String doMain() {
		return "mainPage";
	}

	@PostMapping("login.do")
	public String doLogin(String id, String password, RedirectAttributes redirectAttributes, HttpSession session) {
		// 1. parameter 검증
		System.out.println("아이디: "+id+" , 패스워드: "+password);
		String hashPassword = String.valueOf(HashUtil.hash(password));
		System.out.println("해시 패스워드 : "+hashPassword);
		// 2. 모델 연결(생략 --> id=ssafy, pass=1111)
		User user = userService.login(id, hashPassword);
		System.out.println("유저: "+user);
		// 3. view 연결
		if (user == null) {
			redirectAttributes.addFlashAttribute("msg", "아이디 또는 패스워드가 다릅니다.");
		} else {
			// 성공적으로 로그인 했다면..
			session.setAttribute("user", user);
		}
		return "redirect:main.do";
	}

	@GetMapping("logout.do")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}

	@PostMapping("insert.do")
	public String doSignUp(User user, HttpSession session) {
		// 2. 비밀번호 해시
		int hashPassword = HashUtil.hash(user.getPassword());
		System.out.println(hashPassword);
		user.setPassword(String.valueOf(hashPassword));

		// 3. view 연결
		userService.insertUser(user);
		System.out.println(user);
		session.setAttribute("user", user);
		return "redirect:main.do";
	}

	@PostMapping("update.do")
	public String update(User user, HttpSession session) {
		// 1. parameter 검증
		String hashPass = String.valueOf(HashUtil.hash(user.getPassword()));
		
		user.setPassword(hashPass);
		
		userService.updateUser(user);
		
		session.setAttribute("user", user);
		return "redirect:main.do";
	}

	@PostMapping("delete.do")
	public String doDelete(String userid, HttpSession session) {
		// 2. 모델 연결(생략 --> id=ssafy, pass=1111)
		// 3. view 연결
		User user = userService.findUser(userid);
		userService.deleteUser(user);
		System.out.println(user);
		session.invalidate();
		return "redirect:mainPage.jsp";
	}
	
	/*
	 * map.put("/main.do", new SelectController()); map.put("/search.do", new
	 * SearchController()); map.put("/product_list.do", new
	 * ProductListController()); map.put("/food_info.do", new FoodInfoController());
	 * map.put("/login.do", new LoginController()); map.put("/logout.do", new
	 * LogoutController()); map.put("/update.do", new UpdateController());
	 * map.put("/insert.do", new InsertController()); map.put("/delete.do", new
	 * deleteController());
	 */
}
