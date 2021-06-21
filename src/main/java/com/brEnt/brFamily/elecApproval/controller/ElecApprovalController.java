package com.brEnt.brFamily.elecApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ElecApprovalController {

	// 작성자 : 김혜미 -- 연차 신청폼
	@RequestMapping("offEnrollForm.ea")
	public String offEnrollForm() {
		return "elecApproval/offEnrollForm";
	}
	// 작성자 : 김혜미 -- 연차 신청폼
	@RequestMapping("offCheckForm.ea")
	public String offCheckForm() {
		return "elecApproval/offCheckForm";
	}

	
}
