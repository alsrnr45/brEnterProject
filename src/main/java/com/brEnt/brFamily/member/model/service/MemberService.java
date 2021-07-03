package com.brEnt.brFamily.member.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.store.model.vo.Product;

public interface MemberService {

	
	// 1. 회원 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원 가입용 서비스
	int insertMember(Member m);
	
	// 3. 회원 정보수정용 서비스
	int updateMember(Member m);
	
	// 4. 회원 탈퇴용 서비스
	//int deleteMember(String Id);
	
	// 5. 아이디 중복체크용 서비스
	int idCheck(String Id);
	
	
	//////////// 신규사원 ////////////
	// 작성자 : 김혜미 -- 신규사원 리스트 조회
	ArrayList<Member> newMemberList();

	// 작성자 : 김혜미 -- 신규사원 상세조회
	Member newMemberDetail(int mno);
	
	// 작성자 : 김혜미 -- 신규사원 등록
	int enrollNewMember(Member m);
	
	// 작성자 : 김혜미 -- 신규사원 반려
	int cancelNewMmeber(Member m);
	
	
	//////////// 신규사원 ////////////
	// 작성자 : 김혜미 -- 사원 리스트 조회
	ArrayList<Member> memberList();

	// 작성자 : 김혜미 -- 사원 상세조회
	Member memberDetail(int mno);
	
	// 작성자 : 김혜미 -- 사원 수정폼
	Member memberUpdateForm(int mno);
	
	// 작성자 : 김혜미 -- 사원 수정
	int updateMmeber(Member m);
	
	// 작성자 : 김혜미 -- 사원 탈퇴
	int deleteMember(int mno);
	
	
		
	

	
}
