package com.brEnt.brFamily.personnelMgt.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.personnelMgt.model.dao.PersonnelMgtDao;
import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;
import com.brEnt.brFamily.personnelMgt.model.vo.SalaryDto;

@Service
public class PersonnelMgtServiceImpl implements PersonnelMgtService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PersonnelMgtDao pDao;

	// 작성자 : 안소은 -- 근태관리 조회
	@Override
	public PersonnelMgt selectAttend(int memNo) {
		return pDao.selectAttend(sqlSession, memNo);
	}
	
	// 작성자 : 안소은 -- 근무일수 조회
	@Override
	public PersonnelMgt selectTotalWorkDay(int memNo) {
		return pDao.selectTotalWorkDay(sqlSession, memNo);
	}
	
	// 작성자 : 안소은 -- 출근시간 insert
	@Override
	public int insertCheckIn(PersonnelMgt p) {
		return pDao.insertCheckIn(sqlSession, p);
		
	}

	// 작성자 : 안소은 -- 퇴근시간 insert
	@Override
	public int insertCheckOut(PersonnelMgt p) {
		return pDao.insertCheckOut(sqlSession, p);
	}

	// 작성자 : 김혜미 -- 급여내역 조회
	@Override
	public ArrayList<SalaryDto> slaryList() {
		return pDao.slaryList(sqlSession);
	}
	
	
	
}
