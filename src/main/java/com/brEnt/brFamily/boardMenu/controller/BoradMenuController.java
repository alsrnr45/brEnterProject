package com.brEnt.brFamily.boardMenu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardMenu.model.service.BoardMenuService;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenuReply;
import com.brEnt.brFamily.boardMenu.model.vo.PageMaker;
import com.brEnt.brFamily.member.model.vo.Member;

@Controller
public class BoradMenuController {

	
	@Autowired 
	BoardMenuService bmService;
	
	// 작성자 : 박지은 - 주간식단 게시판 리스트
	@RequestMapping("boardMenuList.bm")
	public ModelAndView boardMenuList(ModelAndView mv,PageMaker pageMaker) throws Exception {

		ArrayList<BoardMenu> boardMenuList = bmService.boardMenuList(pageMaker);
		
		PageMaker npm = bmService.paging(pageMaker);
		npm.setPage(pageMaker.getPage());
		npm.setKeyword(pageMaker.getKeyword());
		
		mv.addObject("boardMenuList", boardMenuList)
		  .addObject("page", npm)
		  .addObject("lastpage", Math.floor(npm.getTotal()/15)+1)
		  .setViewName("boardMenu/boardMenu");
		
		return mv;
	}
	
	// 주간메뉴 상세페이지 (사용자)
	@RequestMapping("boardMenuDetail.bm")
	public ModelAndView boardMenuDetail(ModelAndView mv, BoardMenu bMenu) throws Exception {
		
		bmService.updateCount(bMenu);
		BoardMenu detailMenu = bmService.boardMenuDetail(bMenu);
		ArrayList<BoardMenuReply> reply = bmService.detailReply(bMenu);
		int replyCount = reply.size();
		
		mv.addObject("Detail", detailMenu)
		  .addObject("reply", reply)
		  .addObject("replyCount",replyCount)
		  .setViewName("boardMenu/boardMenuDetail");
		
		return mv;
	}
	
	// 주간메뉴 리스트 (관리자)
	@RequestMapping("adminBoardMenuList.bm")
	public ModelAndView adminBoardMenuList(ModelAndView mv,PageMaker pageMaker) throws Exception {

		ArrayList<BoardMenu> boardMenuList = bmService.boardMenuList(pageMaker);
		
		PageMaker npm = bmService.paging(pageMaker);
		npm.setPage(pageMaker.getPage());
		npm.setKeyword(pageMaker.getKeyword());
		
		mv.addObject("boardMenuList", boardMenuList)
		  .addObject("page", npm)
		  .addObject("lastpage", Math.floor(npm.getTotal()/15)+1)
		  .setViewName("boardMenu/adminBoardMenu");
		
		return mv;
	}
	
	// 주간식단 상세페이지 (관리자)
	@RequestMapping("adminBoardMenuDetail.bm")
	public ModelAndView adminBoardMenuDetail(ModelAndView mv, BoardMenu bMenu) throws Exception {
		
		bmService.updateCount(bMenu);
		BoardMenu detailMenu = bmService.boardMenuDetail(bMenu);
		ArrayList<BoardMenuReply> reply = bmService.detailReply(bMenu);
		int replyCount = reply.size();
		
		mv.addObject("Detail", detailMenu)
		  .addObject("reply", reply)
		  .addObject("replyCount",replyCount)
		  .setViewName("boardMenu/adminBoardMenuDetail");
		
		return mv;
	}
	
	// 주간식단 글 작성 페이지
	@RequestMapping("boardMenuEnroll.bm")
	public ModelAndView adminBoardMenuEnroll(ModelAndView mv, BoardMenu bMenu) throws Exception {
		
		BoardMenu detailMenu = new BoardMenu();
		detailMenu.setWeekmenuNo('0');
		if(bMenu.getWeekmenuNo() > 0 ) {
			detailMenu = bmService.boardMenuDetail(bMenu);
			mv.addObject("Detail", detailMenu);
		}
			mv.setViewName("boardMenu/adminBoardMenuEnroll");
		return mv;
	}
	
	// 주간식단 글 삭제하기
	@RequestMapping("boardMenuDeleteAction.bm")
	public String adminBoardMenuDeleteAction(BoardMenu bMenu) throws Exception {
			bmService.boardMenuDeleteAction(bMenu);
		return "redirect:adminBoardMenuList.bm";
	}
	
	// 주간식단 글 등록, 수정하기
	@RequestMapping("boardMenuEnrollAction.bm")
	public String adminBoardMenuEnrollAction(HttpSession session, BoardMenu bMenu) throws Exception {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		bMenu.setMemNo(loginUser.getMemNo());
		
		if(bMenu.getWeekmenuNo() > 0 ) {
			bmService.updateAction(bMenu);
		}else {
			bmService.EnrollAction(bMenu);
		}

		return "redirect:adminBoardMenuList.bm";
	}
	
	// 주간식단 댓글 등록
	@RequestMapping("boardMenuReplyInsert.bm")
	public String boardMenuReplyInsert(HttpSession session, BoardMenuReply bMenuR) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		bMenuR.setMemNo(loginUser.getMemNo());
		
		bmService.boardMenuReplyInsert(bMenuR);
		
		return "redirect:boardMenuDetail.bm?weekmenuNo="+bMenuR.getWeekmenuNo();
	}
	
	/*
	주간식단 댓글 등록 (관리자) X
	@RequestMapping("adminBoardMenuReplyInsert.bm")
	public String adminBoardMenuReplyInsert(HttpSession session, BoardMenuReply bMenuR) throws Exception {
		Member loginUser = (Member)session.getAttribute("loginUser");
		bMenuR.setMemNo(loginUser.getMemNo());
		
		bmService.boardMenuReplyInsert(bMenuR);
		return "redirect:adminBoardMenuDetail.bm?weekmenuNo="+bMenuR.getWeekmenuNo();
	}
	*/
	
	// 주간식단 댓글 삭제
	@RequestMapping("boardMenuReplyDelete.bm")
	public String boardMenuReplyDelete(BoardMenuReply bMenuR) throws Exception {
		bmService.boardMenuReplyDelete(bMenuR);
		return "redirect:boardMenuDetail.bm?weekmenuNo="+bMenuR.getWeekmenuNo();
	}

	/*
	주간식단 댓글 등록 (관리자) X
	@RequestMapping("adminBoardMenuReplyDelete.bm")
	public String adminBoardMenuReplyDelete(BoardMenuReply bMenuR) throws Exception {
		bmService.boardMenuReplyDelete(bMenuR);
		return "redirect:adminBoardMenuDetail.bm?weekmenuNo="+bMenuR.getWeekmenuNo();
	}
	*/
	
}
