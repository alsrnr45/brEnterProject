package com.brEnt.brFamily.boardFree.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardFree.model.service.BoardFreeService;
import com.brEnt.brFamily.boardFree.model.vo.BoardFree;

@Controller
public class BoardFreeController {
	
	@Autowired
	private BoardFreeService bfService; 
	
	
	// 자유게시판 리스트 
	@RequestMapping("boardFreeList.bf")
	public ModelAndView boardFreeList(ModelAndView mv) { 
		
		ArrayList<BoardFree> list = bfService.selectBoardFreeList();
		
		mv.addObject("list", list)
		  .setViewName("boardFree/boardFreeList"); 
		
		return mv;
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
	public ModelAndView adminBoardFreeList(ModelAndView mv) { 
		
		ArrayList<BoardFree> list = bfService.adminSelectBoardFreeList();
		
		mv.addObject("list", list)
		  .setViewName("boardFree/adminBoardFreeList"); 
		
		return mv; 
	}
		
	// 관리자 자유게시판 디테일 
	@RequestMapping("adminBoardFreeDetail.bf")
	public String adminBoardFreeDetail() { 
		return "boardFree/adminBoardFreeDetail"; 
	}

}
