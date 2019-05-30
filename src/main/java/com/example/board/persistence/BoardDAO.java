package com.example.board.persistence;

import java.util.List;
import com.example.board.domain.BoardVO;
import com.example.board.domain.Criteria;
import com.example.board.domain.MenuVO;

public interface BoardDAO {
	public List<BoardVO> list(Criteria cri) throws Exception;
	public int listCount();
	public void add(BoardVO board);
	public List<MenuVO> getMenuInfo();
	public BoardVO read(int board_id);
}