package com.example.board.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.example.board.domain.BoardVO;
import com.example.board.domain.Criteria;
import com.example.board.domain.MenuVO;
import com.example.board.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;	// 데이터베이스 처리를 위한 DAO를 주입

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return dao.list(cri);	// 게시판 목록 정보를 데이터베이스로부터 가져 온다.
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public void add(BoardVO board) {
		dao.add(board);
	}

	@Override
	public List<MenuVO> getMenuInfo() {
		return dao.getMenuInfo();
	}

	@Override
	public BoardVO read(int board_id) {
		return dao.read(board_id);
	}

}