package com.example.board.persistence;

import java.util.List;
import com.example.board.domain.ArticleVO;
import com.example.board.domain.Criteria;

public interface ArticleDAO {
	public List<ArticleVO> list(Criteria cri) throws Exception;
	public int listCount();
	public void add(ArticleVO article);
}