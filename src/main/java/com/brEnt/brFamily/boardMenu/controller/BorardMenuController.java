package com.brEnt.brFamily.boardMenu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardMenu.model.service.BoardMenuService;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;

@Controller
public class BorardMenuController {

	// 작성자 : 박지은 - 주간식단 게시판 리스트
	@Autowired 
	BoardMenuService bmService;
	
	@RequestMapping("boardMenuList.bm")
	public ModelAndView boardMenuList(ModelAndView mv) throws Exception {
		
		ArrayList<BoardMenu> boardMenuList = bmService.boardMenuList();
		
		mv.addObject("boardMenuList", boardMenuList)
		  .setViewName("boardMenu/boardMenu");
		
		return mv;
	}
}
