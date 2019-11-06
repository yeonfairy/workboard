package com.spring.board.model;

import org.apache.ibatis.type.Alias;

@Alias("BoardVO")
public class BoardVO {

	private int board_id;
	private String title;
	private String writer;
	private String password;
	private String con;
	private int view_cnt;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	@Override
	public String toString() {
		return "boardVO [board_id=" + board_id + ", title=" + title + ", writer=" + writer + ", password=" + password
				+ ", con=" + con + ", view_cnt=" + view_cnt + "]";
	}
	
	
}
