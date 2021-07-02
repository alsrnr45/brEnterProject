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
	
	
	// 자유게시판 상세 조회
	public int increaseCount(SqlSessionTemplate sqlSession, int freeNo) { 
		return sqlSession.update("boardFreeMapper.increaseCount", freeNo); 
	}
	
	public BoardFree selectBoardFree(SqlSessionTemplate sqlSession, int freeNo) {
		return sqlSession.selectOne("boardFreeMapper.selectBoardFree", freeNo); 
	}
	
	
	// 관리자 자유게시판 리스트 조회 
	public ArrayList<BoardFree> adminSelectBoardFreeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardFreeMapper.selectBoardFreeList"); 
	}
	
	
	// 관리자 자유게시판 상세 조회
	public int adminIncreaseCount(SqlSessionTemplate sqlSession, int freeNo) { 
		return sqlSession.update("boardFreeMapper.increaseCount", freeNo); 
	}
		
	public BoardFree adminSelectBoardFree(SqlSessionTemplate sqlSession, int freeNo) {
		return sqlSession.selectOne("boardFreeMapper.selectBoardFree", freeNo); 
	}
	
	
	// 자유게시판 작성
	public int insertBoardFree(SqlSessionTemplate sqlSession, BoardFree bf) {		
		return sqlSession.insert("boardFreeMapper.insertBoardFree", bf); 
	}
	
	
	// 자유게시판 수정 
	public int updateBoardFree(SqlSessionTemplate sqlSession, BoardFree bf) { 
		return sqlSession.update("boardFreeMapper.updateBoardFree", bf); 
	}
	
	
	// 자유게시판 삭제 
	public int deleteBoardFree(SqlSessionTemplate sqlSession, int freeNo) { 
		return sqlSession.update("boardFreeMapper.deleteBoardFree", freeNo); 
	}
	
	
	
}
