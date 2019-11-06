package com.spring.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDaoInterface;
import com.spring.board.model.BoardVO;

@Service
public class BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private UserDaoInterface userDao;
	
	public List<BoardVO> getBoardList() {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		return userDao.getBoardList();
	}

	public int writeBoardS(BoardVO boardVo) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		return userDao.writeBoardI(boardVo);
	}

	public BoardVO getBoardViewS(int board_id) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		return userDao.getBoardViewI(board_id);
	}

	public int changePwS(String password, int board_id) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		return userDao.changePwI(password,board_id);
	}

	public String getPwS(int board_id) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		return userDao.getBoardPwI(board_id);
	}

	public int changeCnt(int board_id, int view_cnt) {
		userDao = sqlSession.getMapper(UserDaoInterface.class);
		return userDao.changeCntI(board_id, view_cnt);
	}

}
