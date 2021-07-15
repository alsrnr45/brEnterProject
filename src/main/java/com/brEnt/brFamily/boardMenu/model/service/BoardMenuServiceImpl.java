package com.brEnt.brFamily.boardMenu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.boardMenu.model.dao.BoardMenuDao;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenuReply;
import com.brEnt.brFamily.boardMenu.model.vo.PageMaker;

@Service
public class BoardMenuServiceImpl implements BoardMenuService {

	
	@Autowired
	BoardMenuDao bmDao;
	
	// 작성자 : 박지은 - 주간식단 게시판 리스트
	
	@Override
	public ArrayList<BoardMenu> boardMenuList(PageMaker pageMaker) throws Exception {
		pageMaker.calc();
		return (ArrayList<BoardMenu>) bmDao.boardMenuList(pageMaker);
	}

	@Override
	public PageMaker paging(PageMaker pageMaker) throws Exception {
		pageMaker.calc();
		return bmDao.pageMaker(pageMaker);
	}

	// 주간식단 상세페이지 
	@Override
	public BoardMenu boardMenuDetail(BoardMenu bMenu) throws Exception {
		return bmDao.boardMenuDetail(bMenu);
	}

	@Override
	public ArrayList<BoardMenuReply> detailReply(BoardMenu bMenu) throws Exception {
		return (ArrayList<BoardMenuReply>)bmDao.detailReply(bMenu);
	}

	@Override
	public void updateCount(BoardMenu bMenu) throws Exception {
		bmDao.updateCount(bMenu);
	}

	// 주간식단 글 삭제 
	@Override
	public void boardMenuDeleteAction(BoardMenu bMenu) throws Exception {
		bmDao.boardMenuDeleteAction(bMenu);
	}

	// 주간식단 글 작성
	@Override
	public void EnrollAction(BoardMenu bMenu) throws Exception {
		bmDao.EnrollAction(bMenu);
	}

	// 주간식단 글 수정
	@Override
	public void updateAction(BoardMenu bMenu) throws Exception {
		bmDao.updateAction(bMenu);
	}

	// 주간식단 댓글 등록
	@Override
	public void boardMenuReplyInsert(BoardMenuReply bMenuR) {
		bmDao.insertReply(bMenuR);
	}

	// 주간식단 댓글 삭제
	@Override
	public void boardMenuReplyDelete(BoardMenuReply bMenuR) {
		bmDao.deleteReply(bMenuR);
	}

}
