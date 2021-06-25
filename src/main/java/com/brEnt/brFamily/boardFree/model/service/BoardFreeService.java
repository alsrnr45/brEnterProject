package com.brEnt.brFamily.boardFree.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.boardFree.model.vo.BoardFree;

public interface BoardFreeService {
	
	// 자유게시판 리스트 조회 
	ArrayList<BoardFree> selectBoardFreeList(); 
	
	// 관리자 자유게시판 리스트 조회 
	ArrayList<BoardFree> adminSelectBoardFreeList(); 
	
	
}
