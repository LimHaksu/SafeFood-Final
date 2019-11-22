package com.ssafy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ssafy.service.UserService;

@Controller
public class HaksuController {

	@Autowired
	UserService userService;

	@GetMapping("main.do")
	public String doMain() {
		return "mainPage";
	}

	@GetMapping("logout.do")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
}
