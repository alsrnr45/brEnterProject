package com.brEnt.brFamily.personnelMgt.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.personnelMgt.model.dao.PersonnelMgtDao;
import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;

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
	
	
	
}
