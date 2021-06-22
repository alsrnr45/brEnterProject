package com.brEnt.brFamily.boardFree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardFreeController {
		
	// 자유게시판 리스트 
	@RequestMapping("boardFreeList.bf")
	public String boardFreeList() { 
		return "boardFree/boardFreeList"; 
	}
		
	// 자유게시판 디테일 
	@RequestMapping("boardFreeDetail.bf")
	public String boardFreeDetail() {
		return "boardFree/boardFreeDetail"; 
	}
		
	// 자유게시판 작성
	@RequestMapping("boardFreeEnroll.bf")
	public String boardFreeEnroll() {
		return "boardFree/boardFreeEnroll"; 
	}
		
	// 자유게시판 수정 
	@RequestMapping("boardFreeUpdate.bf")
	public String boardFreeUpdate() {
		return "boardFree/boardFreeUpdate"; 
	}
		
	// 관리자 자유게시판 리스트 
	@RequestMapping("adminBoardFreeList.bf")
	public String adminBoardFreeList() { 
		return "boardFree/adminBoardFreeList"; 
	}
		
	// 관리자 자유게시판 디테일 
	@RequestMapping("adminBoardFreeDetail.bf")
	public String adminBoardFreeDetail() { 
		return "boardFree/adminBoardFreeDetail"; 
	}

}
