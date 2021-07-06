package com.brEnt.brFamily.personnelMgt.model.service;

import com.brEnt.brFamily.personnelMgt.model.vo.PersonnelMgt;

public interface PersonnelMgtService {
	
	// 작성자 : 안소은 -- 근태관리 조회
	PersonnelMgt selectAttend(int memNo);

}
