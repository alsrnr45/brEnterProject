package com.brEnt.brFamily.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	// 작성자 : 김혜미 -- 신규사원 리스트(관리자)
	@RequestMapping("newMemberList.admin")
	public String newMemberList() {
		return "member/adminNewMemberList";
	}
	
	// 작성자 : 김혜미 -- 신규사원 디테일(관리자)
	@RequestMapping("newMemberDetail.admin")
	public String newMemberDetail() {
		return "member/adminNewMemberDetail";
	}
	
	// 작성자 : 김혜미 -- 사원 리스트(관리자)
	@RequestMapping("memberList.admin")
	public String memberList() {
		return "member/adminMemberList";
	}	

	// 작성자 : 김혜미 -- 사원 디테일(관리자)
	@RequestMapping("memberDetail.admin")
	public String memberDetail() {
		return "member/adminMemberDetail";
	}
	
	
	
	
}
