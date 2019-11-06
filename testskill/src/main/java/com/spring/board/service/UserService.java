package com.spring.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDaoInterface;

@Service
public class UserService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserDaoInterface userDao;
	
	public String getPw(String user_id, String remember_id, HttpSession session, HttpServletResponse response, String password) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		System.out.println("서비스에서 체크박스값 확인 : " + remember_id);
		if(remember_id != null) { // 자동로그인 체크박스 체크되어있는지 확인
			if(password.equals(userDao.getPwI(user_id))) { // 사용자가 입력한 비밀번호와 해당아이디의 데이터베이스에서 가져온 비밀번호 값이 일치하면 세션 생성
				session.setAttribute("remember_id", user_id);
				System.out.println("리멤서 세션 생성");
			}
		} else {
			session.removeAttribute("remember_id");
		}
		System.out.println("서비스에서 리멤버 세션 확인 : " + session.getAttribute("remember_id"));
		/*Cookie cookie = new Cookie("remember_id", user_id);
		if(remember_id.equals("on")) {
			response.addCookie(cookie);
		} else {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}*/
		return userDao.getPwI(user_id);
	}

}
