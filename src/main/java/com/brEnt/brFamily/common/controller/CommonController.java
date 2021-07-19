package com.brEnt.brFamily.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	// 로그인후 홈메인
		@RequestMapping("brEnter.main")
		public String brEnter() {
			return "common/userMain"; 
		}
	
}
