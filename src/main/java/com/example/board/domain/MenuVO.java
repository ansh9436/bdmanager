package com.example.board.domain;

public class MenuVO {
	private int board_id;		// 게시판 아이디 (게시판을 고유하게 식별)
	private String url;			// 게시글을 관리하기 위한 페이지로 이동을 위한 URL﻿
	private String board_name;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	@Override
	public String toString() {
		return "MenuVO [board_id=" + board_id + ", url=" + url + ", board_name=" + board_name + "]";
	}
}