package com.brEnt.brFamily.phoneBook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;
import com.brEnt.brFamily.phoneBook.model.dao.PhoneBookDao;

@Service
public class PhoneBookServiceImpl implements PhoneBookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PhoneBookDao pbDao;
	
	@Override
	public ArrayList<Member> popupView() {
		return pbDao.popupView(sqlSession);
	}

	@Override
	public ArrayList<Dept> popupDeptView() {
		return pbDao.popupDeptView(sqlSession);
	}

	@Override
	public ArrayList<Position> popupPositionView() {
		return pbDao.popupPositionView(sqlSession);
	}

}
