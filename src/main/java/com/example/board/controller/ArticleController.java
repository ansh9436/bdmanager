package com.example.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.example.board.domain.ArticleVO;
import com.example.board.domain.Criteria;
import com.example.board.domain.PageMaker;
import com.example.board.service.ArticleService;
import com.example.board.service.BoardService;

@Controller
@RequestMapping(value="/article")
public class ArticleController {
	@Inject
	public ArticleService service;	// 게시글 관리 기능을 처리하기 위한 Service
	
	@Inject
	public BoardService bService;	// 게시판 관리 기능을 처리하기 위한 Service
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(int board_id, Criteria cri, Model model) throws Exception {
		model.addAttribute("board", bService.read(board_id));	// 해당 게시판에 대한 정보를 가져온다.
		model.addAttribute("list", service.list(cri));			// 해당 게시판의 게시글 목록 정보를 가져온다.
		PageMaker pm = new PageMaker();							// 페이징 처리를 위한 인스턴스를 만든다.
		pm.setCri(cri);											// 페이징 처리를 위한 기준 정보를 저장
		pm.setTotalCount(service.listCount());					// 해당 게시판의 전체 게시글의 수를 얻는다.
		model.addAttribute("pageMaker", pm);					// 페이징 처리를 위한 정보를 model에 저장
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write(int board_id, Model model) {
		model.addAttribute("board", bService.read(board_id));	// 해당 게시판에 대한 정보를 획득
		return "/article/writeForm";							// 게시글 입력 창으로 이동
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(ArticleVO article, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		article.setIp(ip);
		article.setSecret("F");
		service.add(article);
		return "redirect:/article/list?board_id=" + article.getBoard_id();
	}
}