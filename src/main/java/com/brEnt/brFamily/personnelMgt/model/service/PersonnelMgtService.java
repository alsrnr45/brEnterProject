package com.brEnt.brFamily.personnelMgt.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;
import com.brEnt.brFamily.personnelMgt.model.vo.SalaryDto;

public interface PersonnelMgtService {
	
	// 작성자 : 안소은 -- 근태관리 조회
	PersonnelMgt selectAttend(int memNo);
	
	// 작성자 : 안소은 -- 근무일수 조회
	PersonnelMgt selectTotalWorkDay(int memNo);
	
	PersonnelMgt selectToday(int memNo);
	
	// 작성자 : 안소은 -- 출근시간 insert
	int insertCheckIn(PersonnelMgt p);
	
	// 작성자 : 안소은 -- 퇴근시간 insert
	int insertCheckOut(PersonnelMgt p);

	// 작성자 : 김혜미 -- 급여내역 조회
	ArrayList<SalaryDto> slaryList();
}
