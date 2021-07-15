package com.brEnt.brFamily.boardMenu.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenuReply;
import com.brEnt.brFamily.boardMenu.model.vo.PageMaker;

public interface BoardMenuService {
	
	// 작성자 : 박지은 - 주간식단 게시판 리스트
	ArrayList<BoardMenu> boardMenuList(PageMaker pageMaker) throws Exception;

	PageMaker paging(PageMaker pageMaker) throws Exception;

	// 주간메뉴 상세페이지 
	BoardMenu boardMenuDetail(BoardMenu bMenu) throws Exception;

	ArrayList<BoardMenuReply> detailReply(BoardMenu bMenu) throws Exception;

	void updateCount(BoardMenu bMenu) throws Exception;

	// 주간식단 글 삭제
	void boardMenuDeleteAction(BoardMenu bMenu) throws Exception;

	// 주간식단 글작성 
	void EnrollAction(BoardMenu bMenu) throws Exception;

	// 주간식단 글 수정
	void updateAction(BoardMenu bMenu) throws Exception;

	// 주간식단 댓글 등록
	void boardMenuReplyInsert(BoardMenuReply bMenuR);

	// 주간식단 댓글 삭제
	void boardMenuReplyDelete(BoardMenuReply bMenuR);

}
