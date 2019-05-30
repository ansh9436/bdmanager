package com.example.board.controller;

import java.util.List;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.board.domain.BoardVO;
import com.example.board.domain.Criteria;
import com.example.board.domain.MenuVO;
import com.example.board.domain.PageMaker;
import com.example.board.service.ArticleService;
import com.example.board.service.BoardService;

@Controller
@RequestMapping("/manager")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;	// 게시판 관리기능에 대한 처리를 당당하는 BoardService를 주입
	
	@Inject
	private ArticleService aService;	// 게시글 처리를 담당하는 ArticleService를 주입
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Criteria cri, Model model) throws Exception {	// View로는 기본적으로 list.jsp가 사용됨
		List<BoardVO> list = service.list(cri);	// 게시판 목록 정보를 가져온다.
		for(int i = 0;i < list.size();i++) {	// 게시판의 게시글 수를 가져와 저장한다.﻿
			BoardVO board = list.get(i);
			board.setNofArticle(aService.listCount());
		}
		model.addAttribute("list", list);		// 게시판 목록 정보를 model에 저장한다.
		PageMaker pm = new PageMaker();			// 페이징 처리를 위해 필요한 정보를 담을 클래스를 인스턴스화
		pm.setCri(cri);							// 페이징 처리를 위한 기준을 저장 (cri는 기본값이 있지만, 사용
		pm.setTotalCount(service.listCount());	// 자가 파라미터로 제공 가능. 전체 게시판의 수를 얻는다.﻿
		model.addAttribute("pageMaker", pm);	// 페이징 정보를 model에 저장
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() {
		return "/manager/writeForm";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePro(BoardVO board) {		// 게시판 정보를 입력 받아
		service.add(board);						// ﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿
		return "redirect:/manager/list";
	}
	
	@RequestMapping(value="/getMenuInfo", method=RequestMethod.GET)
	public @ResponseBody List<MenuVO> getMenuInfo() {
		List<MenuVO> list = service.getMenuInfo();
		return list;
	}
}