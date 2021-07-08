package com.brEnt.brFamily.personnelMgt.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;

public interface PersonnelMgtService {
	
	// 작성자 : 안소은 -- 근태관리 조회
	ArrayList<PersonnelMgt> selectAttend(int memNo);
	
	// 작성자 : 안소은 -- 근무일수 조회
	PersonnelMgt selectTotalWorkDay(int memNo);

}
