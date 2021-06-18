package com.brEnt.brFamily.personnelMgt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonnelMgtController {

	// 작성자 : 김혜미 -- 급여내역 리스트
	@RequestMapping("salaryList.pm")
	public String slaryList() {
		return "personnelMgt/slaryList";
	}
	
	// 작성자 : 김혜미 -- 연차 조회
	@RequestMapping("offList.pm")
	public String offList() {
		return "personnelMgt/offList";
	}
}
