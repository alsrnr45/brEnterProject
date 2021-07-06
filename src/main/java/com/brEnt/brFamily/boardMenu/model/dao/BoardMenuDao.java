package com.brEnt.brFamily.boardMenu.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.boardMenu.model.vo.BoardMenu;

@Repository
public class BoardMenuDao {
	
	// 작성자 : 박지은 - 주간식단 게시판 리스트
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<BoardMenu> boardMenuList() {
		return sqlSession.selectList("menuMapper.boardMenuList");
	}
	

}
