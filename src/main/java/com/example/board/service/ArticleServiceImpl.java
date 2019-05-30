package com.example.board.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.example.board.domain.ArticleVO;
import com.example.board.domain.Criteria;
import com.example.board.persistence.ArticleDAO;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Inject
	private ArticleDAO dao;	// 데이터베이스 처리를 위한 DAO를 주입

	@Override
	public List<ArticleVO> list(Criteria cri) throws Exception {
		return dao.list(cri);	// 게시판 목록 정보를 데이터베이스로부터 가져 온다.
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public void add(ArticleVO article) {
		dao.add(article);
	}

}