package com.brEnt.brFamily.elecApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class elecApprovalController {

	// 작성자 : 김혜미 -- 연차 신청폼
	@RequestMapping("offForm.ea")
	public String offForm() {
		return "elecApproval/offForm";
	}
	
}
