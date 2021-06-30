package com.brEnt.brFamily.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.member.model.service.MemberService;
import com.brEnt.brFamily.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired 
	private MemberService mService; //변수선언(전역변수 세팅)
		
	// 작성자 : 정예빈 -- 로그인 

			/*
			// url 재요청 방식
			return "redirect:/";
			session.setAttribute("loginUser",loginUser); -> 로그인회원 세션에 담는것 
			
			// 포워딩 방식 (/WEB-INF/views/common/**.jsp)
			return "common/userMain";  
			 */
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { // 로그인 실패
			
			mv.setViewName("redirect:/");
		
		}else { // 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("common/userMain");
		}
		
		return mv;
		
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "member/login";
	}
		
	
	

	// 작성자 : 김혜미 -- 신규사원 리스트(관리자)
	@RequestMapping("newMemberList.admin")
	public ModelAndView newMemberList(ModelAndView mv) {
		
		ArrayList<Member> list = mService.newMemberList();
		
		mv.addObject("list", list)
		  .setViewName("member/adminNewMemberList");
		
		return mv;
	}
	
	// 작성자 : 김혜미 -- 신규사원 디테일(관리자)
	@RequestMapping("newMemberDetail.admin")
	public String newMemberDetail() {
		return "member/adminNewMemberDetail";
	}
	
	// 작성자 : 김혜미 -- 사원 리스트(관리자)
	@RequestMapping("memberList.admin")
	public ModelAndView memberList(ModelAndView mv) {
		
		ArrayList<Member> list = mService.memberList();
		System.out.println(list);
		mv.addObject("list", list)
		  .setViewName("member/adminMemberList");
		
		return mv;
	}	

	// 작성자 : 김혜미 -- 사원 디테일(관리자)
	@RequestMapping("memberDetail.admin")
	public String memberDetail() {
		return "member/adminMemberDetail";
	}
	

	
	
}
