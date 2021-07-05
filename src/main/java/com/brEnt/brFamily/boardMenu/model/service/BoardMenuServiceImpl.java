package com.brEnt.brFamily.boardMenu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.boardMenu.model.dao.BoardMenuDao;
import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;

@Service
public class BoardMenuServiceImpl implements BoardMenuService {

	// 작성자 : 박지은 - 주간식단 게시판 리스트
	@Autowired
	BoardMenuDao bmDao;
	
	@Override
	public ArrayList<BoardMenu> boardMenuList() throws Exception {
		return (ArrayList<BoardMenu>) bmDao.boardMenuList();
	}

}
