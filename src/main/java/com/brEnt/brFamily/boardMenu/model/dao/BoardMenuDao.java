package com.brEnt.brFamily.boardMenu.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenuReply;
import com.brEnt.brFamily.boardMenu.model.vo.PageMaker;

@Repository
public class BoardMenuDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 작성자 : 박지은 - 주간식단 게시판 리스트
	
	public List<BoardMenu> boardMenuList(PageMaker pageMaker) {
		return sqlSession.selectList("menuMapper.boardMenuList", pageMaker);
	}

	public PageMaker pageMaker(PageMaker pageMaker) {
		return sqlSession.selectOne("menuMapper.pageMaker", pageMaker);
	}

	// 주간식단 상세페이지
	public BoardMenu boardMenuDetail(BoardMenu bMenu) {
		return sqlSession.selectOne("menuMapper.boardMenuDetail",bMenu);
	}

	public List<BoardMenuReply> detailReply(BoardMenu bMenu) {
		return sqlSession.selectList("menuMapper.detailReply",bMenu);
	}

	public void updateCount(BoardMenu bMenu) {
		sqlSession.update("menuMapper.updateCount", bMenu);
	}

	// 주간식단 글 삭제 
	public void boardMenuDeleteAction(BoardMenu bMenu) {
		sqlSession.delete("menuMapper.boardMenuReplyDeleteAction", bMenu);
		sqlSession.delete("menuMapper.boardMenuDeleteAction", bMenu);
	}

	// 주간식단 글 작성
	public void EnrollAction(BoardMenu bMenu) {
		sqlSession.insert("menuMapper.boardMenuEnroll",bMenu);
	}

	// 주간식단 글 수정
	public void updateAction(BoardMenu bMenu) {
		sqlSession.update("menuMapper.boardMenuUpdate",bMenu);
	}

	// 주간식단 댓글 등록
	public void insertReply(BoardMenuReply bMenuR) {
		sqlSession.insert("menuMapper.insertReply", bMenuR);
	}

	// 주간식단 댓글 삭제
	public void deleteReply(BoardMenuReply bMenuR) {
		sqlSession.delete("menuMapper.deleteReply",bMenuR);
	}
	

}
