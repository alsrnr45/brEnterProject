package com.brEnt.brFamily.phoneBook.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;

@Repository
public class PhoneBookDao {

	public ArrayList<Member> popupView(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("phoneBookMapper.popupView");
	}

	public ArrayList<Dept> popupDeptView(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("phoneBookMapper.popupDeptView");
	}

	public ArrayList<Position> popupPositionView(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("phoneBookMapper.popupPositionView");
	}

}
