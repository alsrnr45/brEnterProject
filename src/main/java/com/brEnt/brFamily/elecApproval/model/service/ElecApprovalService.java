package com.brEnt.brFamily.elecApproval.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;

public interface ElecApprovalService {
   
	// 작성자 : 최선희 -- 전자결재 전체 리스트 조회
    ArrayList<ElecApproval> selectApprovalTotalList(); 
   
    // 작성자 : 안소은 -- 전자결재 결재선 부서조회
    ArrayList<Dept> selectDept();
    
    // 작성자 : 안소은 -- 전자결재 결재선 멤버조회
    ArrayList<Member> selectMember();
   
    // 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
    ArrayList<Member> selectMemberList(int memNo);
}