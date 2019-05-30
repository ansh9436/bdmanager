package com.example.board.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.board.domain.BoardVO;
import com.example.board.domain.Criteria;
import com.example.board.domain.MenuVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession session;		// MyBatis 처리를 위한 SqlSession을 주입
	private static String namespace = "com.example.board.mappers.BoardMapper";

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {	// MyBatis에서 게시판 목록 정보를 가져온다.
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int listCount() {
		return session.selectOne(namespace + ".listCount");
	}

	@Override
	public void add(BoardVO board) {
		session.insert(namespace + ".add", board);
	}

	@Override
	public List<MenuVO> getMenuInfo() {
		return session.selectList(namespace + ".getMenuInfo");
	}

	@Override
	public BoardVO read(int board_id) {
		return session.selectOne(namespace + ".read", board_id);
	}

}