package com.spring.board.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		boolean loginChk = false;
		System.out.println("컨트롤러에서 세션 확인 : " + session.getAttribute("remember_id"));
		
		if(session.getAttribute("remember_id") == null) {
			loginChk = false;
		} else {
			loginChk = true;
		}
		/*Cookie[] cookies = request.getCookies(); // 저장된 쿠키를 가져옴
		System.out.println(cookies);
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				System.out.println(cookies[i].getName());
				if(cookies[i].getName().equals("remember_id")) {
					loginChk = true;
				} else {
					loginChk = false;
				}
			}
		} else {
			loginChk = false;
		}*/
		
		if(loginChk) {
			return "redirect:/board/list";
		} else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.POST)
	//@ResponseBody
	public String loginOk(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String remember_id = request.getParameter("remember_id");
		
		System.out.println(user_id + "," + remember_id + "," + password);
		
		if (password.equals(userService.getPw(user_id,remember_id, session, response, password))) { // 사용자가 입력한 비밀번호와 데이터베이스이 비밀번호를 비교
			System.out.println("비밀번호 일치 : " + userService.getPw(user_id,remember_id, session, response, password));
			session.setAttribute("userSession", user_id); // 아이디와 비밀번호가 일치(로그인)하면 유저정보 세션에 저장
			return "redirect:/board/list";
		} else {
			System.out.println("비밀번호 불일치 : " + userService.getPw(user_id,remember_id, session, response, password));
			return "redirect:/";
		}
		//return userService.getPw(user_id,remember_id, session, response);
		
	}
}
