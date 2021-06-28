package com.brEnt.brFamily.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brEnt.brFamily.member.model.service.MemberService;
import com.brEnt.brFamily.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired 
	private MemberService mService; //변수선언(전역변수 세팅)
		
	// 작성자 : 정예빈 -- 로그인 
	/*
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session) {

		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { //로그인 실패 -> 다시 로그인화면
			//System.out.println("로그인실패");
			
			// url 재요청 방식
			return "redirect:/";
		
			
		}else {//로그인성공 -> 메인페이지	
			//System.out.println("로그인성공");
			session.setAttribute("loginUser",loginUser);
			
			// 포워딩 방식 (/WEB-INF/views/common/errorPage.jsp)
			return "common/userMain";  
		
		}
	}
	*/
	@RequestMapping("login.me")
	public String loginMember(Member m)
	
	
	
	
	
	
	
	
	
	
	
	

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
