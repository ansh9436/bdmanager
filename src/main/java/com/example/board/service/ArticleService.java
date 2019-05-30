package com.example.board.service;

import java.util.List;
import com.example.board.domain.ArticleVO;
import com.example.board.domain.Criteria;

public interface ArticleService {
	public List<ArticleVO> list(Criteria cri) throws Exception;
	public int listCount() throws Exception;
	public void add(ArticleVO article);
}