package com.example.board.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.board.domain.ArticleVO;
import com.example.board.domain.Criteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	@Inject
	private SqlSession session;		// MyBatis 처리를 위한 SqlSession을 주입
	private static String namespace = "com.example.board.mappers.ArticleMapper";

	@Override
	public List<ArticleVO> list(Criteria cri) throws Exception {	// MyBatis에서 게시판 목록 정보를 가져온다.
		return session.selectList(namespace + ".list", cri);
	}

	@Override
	public int listCount() {
		return session.selectOne(namespace + ".listCount");
	}

	@Override
	public void add(ArticleVO article) {
		session.insert(namespace + ".add", article);
	}

}