package com.brEnt.brFamily.member.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.store.model.vo.Product;

public interface MemberService {

	
	// 작성자 : 정예빈 - 로그인
	Member loginMember(Member m);
	
	// 작성자 : 김혜미 - 신규사원 리스트조회
	ArrayList<Member> newMemberList();

	// 작성자 : 김혜미 - 신규사원 상세조회
	Member newMemberDetail(int mno);
	
	// 작성자 : 김혜미 - 신규사원 등록
	int enrollNewMember(Member m);
	
	// 작성자 : 김혜미 - 신규사원 반려
	int returnMember(int mno);
	
	// 작성자 : 김혜미 - 사원 리스트조회
	ArrayList<Member> memberList();

	// 작성자 : 김혜미 - 사원 상세조회
	Member memberDetail(int mno);
	
	// 작성자 : 김혜미 - 사원 수정
	int updateMember(Member m);
	
	// 작성자 : 김혜미 - 사원 탈퇴
	int deleteMember(int mno);

	// 메인 전자결재 리스트 
	// 작성자 : 최선희 - 전자결재 기안함 리스트 조회
    ArrayList<ElecApproval> selectApprovalTotalList();

	
}
