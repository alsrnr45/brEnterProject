package com.brEnt.brFamily.personnelMgt.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.personnelMgt.model.vo.Off;
import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;
import com.brEnt.brFamily.personnelMgt.model.vo.SalaryDto;

@Repository
public class PersonnelMgtDao {

	// 작성자 : 안소은 -- 오늘 날짜로 출근시간이 찍혀있는지 조회
	public PersonnelMgt selectToday(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("personnelMgtMapper.selectToday", memNo);
	}
	
	// 작성자 : 안소은 -- 근무일수 조회
	public PersonnelMgt selectTotalWorkDay(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("personnelMgtMapper.selectTotalWorkDay", memNo);
	}
	
	// 작성자 : 안소은 -- 출근시간 조회
	public PersonnelMgt selectCheckIn(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("personnelMgtMapper.selectCheckIn", memNo);
	}
	
	// 작성자 : 안소은 -- 퇴근시간 조회
	public PersonnelMgt selectCheckOut(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("personnelMgtMapper.selectCheckOut", memNo);
	}
	
	// 작성자 : 안소은 -- 출근시간 insert
	public int insertCheckIn(SqlSessionTemplate sqlSession, PersonnelMgt p) {
		return sqlSession.insert("personnelMgtMapper.insertCheckIn", p);
	}
	
	// 작성자 : 안소은 -- 퇴근시간 insert
	public int insertCheckOut(SqlSessionTemplate sqlSession, PersonnelMgt p) {
		return sqlSession.update("personnelMgtMapper.insertCheckOut", p);
	}

	// 작성자 : 김혜미 -- 급여내역 조회
	public ArrayList<SalaryDto> slaryList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("personnelMgtMapper.slaryList");
	}
	
	// 작성자 : 김혜미 -- 연차내역 조회
	public ArrayList<Off> offList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("personnelMgtMapper.offList");
	}
	
}