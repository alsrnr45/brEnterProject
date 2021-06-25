package com.brEnt.brFamily.boardFree.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.boardFree.model.vo.BoardFree;

@Repository 
public class BoardFreeDao {
	
	// 자유게시판 리스트 조회 
	public ArrayList<BoardFree> selectBoardFreeList(SqlSessionTemplate sqlSession) { 
		return (ArrayList)sqlSession.selectList("boardFreeMapper.selectBoardFreeList");
	}
	
	// 관리자 자유게시판 리스트 조회 
	public ArrayList<BoardFree> adminSelectBoardFreeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardFreeMapper.selectBoardFreeList"); 
	}
	
	
}
