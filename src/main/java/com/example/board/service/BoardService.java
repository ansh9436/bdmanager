package com.example.board.service;

import java.util.List;
import com.example.board.domain.BoardVO;
import com.example.board.domain.Criteria;
import com.example.board.domain.MenuVO;

public interface BoardService {
	public List<BoardVO> list(Criteria cri) throws Exception;
	public int listCount() throws Exception;
	public void add(BoardVO board);
	public List<MenuVO> getMenuInfo();
	public Object read(int board_id);
}