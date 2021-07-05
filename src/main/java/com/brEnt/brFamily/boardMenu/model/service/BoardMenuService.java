package com.brEnt.brFamily.boardMenu.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;

public interface BoardMenuService {
	
	// 작성자 : 박지은 - 주간식단 게시판 리스트
	ArrayList<BoardMenu> boardMenuList() throws Exception;

}
