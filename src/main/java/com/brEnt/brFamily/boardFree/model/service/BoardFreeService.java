package com.brEnt.brFamily.boardFree.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.boardFree.model.vo.BoardFree;
import com.brEnt.brFamily.boardFree.model.vo.BoardFreeReply;

public interface BoardFreeService {
	
	// 자유게시판 리스트 조회
	ArrayList<BoardFree> selectBoardFreeList(); 
	
	
	// 자유게시판 상세 조회 
	int increaseCount(int freeNo);
	BoardFree selectBoardFree(int freeNo);
	
	
	// 관리자 자유게시판 리스트 조회 
	ArrayList<BoardFree> adminSelectBoardFreeList(); 
	
	
	// 관리자 자유게시판 상세 조회 
	int adminIncreaseCount(int freeNo);
	BoardFree adminSelectBoardFree(int freeNo);
	
	
	// 자유게시판 작성 
	int	insertBoardFree(BoardFree bf); 
	
	
	// 자유게시판 수정
	int updateBoardFree(BoardFree bf); 
	
	
	// 자유게시판 삭제
	int deleteBoardFree(int freeNo);
	
		
	// 댓글 리스트 조회 
	ArrayList<BoardFreeReply> selectReplyList(int freeNo); 
	
	
	// 관리자 댓글 리스트 조회 
	ArrayList<BoardFreeReply> adminSelectReplyList(int freeNo); 
	
		
	// 댓글 작성 
	int insertReply(BoardFreeReply r); 
	
	
	// 댓글 수정 
	int updateReply(BoardFreeReply r); 
	
	
	// 댓글 삭제 
	int deleteReply(int freeReplyNo);
	
	
}
