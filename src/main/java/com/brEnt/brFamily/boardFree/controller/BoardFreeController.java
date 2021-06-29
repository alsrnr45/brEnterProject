package com.brEnt.brFamily.boardFree.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardFree.model.service.BoardFreeService;
import com.brEnt.brFamily.boardFree.model.vo.BoardFree;

@Controller
public class BoardFreeController {
	
	@Autowired
	private BoardFreeService bfService; 
	
	
	// 자유게시판 리스트 조회
	@RequestMapping("boardFreeList.bf")
	public ModelAndView boardFreeList(ModelAndView mv) { 
		
		ArrayList<BoardFree> list = bfService.selectBoardFreeList();
		
		mv.addObject("list", list)
		  .setViewName("boardFree/boardFreeList"); 
		
		return mv;
	}
	
	// 관리자 자유게시판 리스트 조회
	@RequestMapping("adminBoardFreeList.bf")
	public ModelAndView adminBoardFreeList(ModelAndView mv) { 
			
		ArrayList<BoardFree> list = bfService.adminSelectBoardFreeList();
			
		mv.addObject("list", list)
		  .setViewName("boardFree/adminBoardFreeList"); 
			
		return mv; 
	}
	
	// 자유게시판 상세 조회 
	@RequestMapping("boardFreeDetail.bf")
	public String selectBoardFree(int bfno, Model model) {
		
		int result = bfService.increaseCount(bfno); 
		
		if(result > 0) {
			BoardFree bf = bfService.selectBoardFree(bfno); 
			model.addAttribute("bf", bf); 
			return "boardFree/boardFreeDetail"; 
			
		}else { 
			model.addAttribute("errorMsg", "자유게시글 상세 조회 실패"); 
			return "common/errorPage"; 
		}		
	}
	
	// 관리자 자유게시판 상세 조회
	@RequestMapping("adminBoardFreeDetail.bf")
	public String adminSelectBoardFree(int bfno, Model model) {
			
		int result = bfService.adminIncreaseCount(bfno); 
			
		if(result > 0) {
			BoardFree bf = bfService.adminSelectBoardFree(bfno); 
			model.addAttribute("bf", bf); 
			return "boardFree/adminBoardFreeDetail"; 
				
		}else { 
			model.addAttribute("errorMsg", "관리자 자유게시글 상세 조회 실패"); 
			return "common/errorPage"; 
		}		
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
		
	
		
	



	
	
	
	
	
}
