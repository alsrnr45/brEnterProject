package com.brEnt.brFamily.personnelMgt.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.personnelMgt.model.vo.Off;
import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;
import com.brEnt.brFamily.personnelMgt.model.vo.SalaryDto;

public interface PersonnelMgtService {
	
	// 작성자 : 안소은 -- 오늘날짜count 조회
	PersonnelMgt countToday(int memNo);
	
	// 작성자 : 안소은 -- 퇴근시간count 조회
	PersonnelMgt countCheckOut(int memNo);
	
	// 작성자 : 안소은 — 근무일수 조회
	PersonnelMgt selectTotalWorkDay(int memNo);
	
	// 작성자 : 안소은 — 출근시간 조회
	PersonnelMgt selectCheckIn (int memNo);
	
	// 작성자 : 안소은 — 퇴근시간 조회
	PersonnelMgt selectCheckOut(int memNo);
	
	// 작성자 : 안소은 — 출근시간 insert
	int insertCheckIn(PersonnelMgt p);
	
	// 작성자 : 안소은 — 퇴근시간 insert
	int insertCheckOut(PersonnelMgt p);

	// 작성자 : 김혜미 — 급여내역 조회
	ArrayList<SalaryDto> slaryList();
	
	// 작성자 : 김혜미 -- 연차내역 조회
	ArrayList<Off> offList();
}