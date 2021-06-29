package com.brEnt.brFamily.boardFree.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.boardFree.model.dao.BoardFreeDao;
import com.brEnt.brFamily.boardFree.model.vo.BoardFree;

@Service
public class BoardFreeServiceImpl implements BoardFreeService {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	@Autowired
	private BoardFreeDao bfDao; 
	
	
	// 자유게시판 리스트 조회 
	@Override 
	public ArrayList<BoardFree> selectBoardFreeList() {		
		return bfDao.selectBoardFreeList(sqlSession);
	}

	
	// 자유게시판 상세 조회 
	@Override
	public int increaseCount(int freeNo) {
		return bfDao.increaseCount(sqlSession, freeNo); 
	}

	@Override
	public BoardFree selectBoardFree(int freeNo) {
		return bfDao.selectBoardFree(sqlSession, freeNo);
	}
	
	
	// 관리자 자유게시판 리스트 조회 
	@Override 
	public ArrayList<BoardFree> adminSelectBoardFreeList() {
		return bfDao.adminSelectBoardFreeList(sqlSession);
	}
	
	
	// 관리자 자유게시판 상세 조회
	@Override
	public int adminIncreaseCount(int freeNo) {
		return bfDao.adminIncreaseCount(sqlSession, freeNo);
	}

	@Override
	public BoardFree adminSelectBoardFree(int freeNo) {
		return bfDao.adminSelectBoardFree(sqlSession, freeNo);
	}

	
	
	
	
	
	
}
