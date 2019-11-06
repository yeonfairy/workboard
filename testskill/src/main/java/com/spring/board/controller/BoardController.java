package com.spring.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.model.BoardVO;
import com.spring.board.model.UserVO;
import com.spring.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "board/list", method = RequestMethod.GET)
	public ModelAndView board() {
		List<BoardVO> viewData = boardService.getBoardList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("board/list");
		modelAndView.addObject("boardList",viewData);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "board/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value = "board/writeForm", method = RequestMethod.POST)
	public String writeBoard(BoardVO boardVo) {
		System.out.println(boardVo);
		boardService.writeBoardS(boardVo);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "board/boardView/{board_id}", method = RequestMethod.GET)
	public String boardView(@PathVariable("board_id") int board_id, Model model) {
		BoardVO boardVo = boardService.getBoardViewS(board_id);
		
		model.addAttribute("boardVo", boardVo);
		return "board/boardView";
	}
	
	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	@ResponseBody
	public String changePw(String password, int board_id) {
		boardService.changePwS(password, board_id);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value = "board/getPw/{board_id}")
	@ResponseBody
	public String getPw(@PathVariable("board_id") int board_id) {
		return boardService.getPwS(board_id);
	}
	
	@RequestMapping(value = "board/viewCnt")
	@ResponseBody
	public String viewCnt(HttpServletRequest request) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int view_cnt = Integer.parseInt(request.getParameter("view_cnt"));
		String password = request.getParameter("password");
		
		System.out.println(view_cnt + ":" + board_id);
		
		view_cnt = view_cnt + 1;
		System.out.println(view_cnt);
		boardService.changeCnt(board_id, view_cnt);

		if(password != "" || password != null) {
			return "board/pwChk";
		} else {
			return "board/list";
		}
	}
	
	@RequestMapping(value = "board/pwChk", method = RequestMethod.GET)
	public String goPwChk(HttpServletRequest request, Model model) {
		System.out.println(request.getParameter("board_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int view_cnt = Integer.parseInt(request.getParameter("view_cnt"));
		
		model.addAttribute("board_id",board_id);
		model.addAttribute("view_cnt",view_cnt);
		return "board/pwChk";
	}
	
	@RequestMapping(value = "board/pwChk", method = RequestMethod.POST)
	@ResponseBody
	public String pwChk(int board_id, String password) {
		String dbPw = boardService.getPwS(board_id);
		if(dbPw.equals(password)) {
			return "1";
		} else {
			return "2";
		}
	}
	
	@RequestMapping(value = "board/boardView/makePw", method = RequestMethod.GET)
	public String goMakePw(HttpServletRequest request, Model model) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		model.addAttribute("board_id",board_id);
		return "board/makePw";
	}
	
	@RequestMapping(value = "board/makePwInWrite", method = RequestMethod.GET)
	public String goMakePwInWrite() {
		return "board/makePwInWrite";
	}
}
