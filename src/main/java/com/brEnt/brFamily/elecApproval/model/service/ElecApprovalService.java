package com.brEnt.brFamily.elecApproval.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.elecApproval.model.vo.Approval_path;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.elecApproval.model.vo.ExpenseForm;
import com.brEnt.brFamily.elecApproval.model.vo.Off;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;

public interface ElecApprovalService {
   
	// 작성자 : 최선희 -- 전자결재 기안함 리스트 조회
    ArrayList<ElecApproval> selectApprovalTotalList(); 
    
    // 작성자 : 최선희 -- 전자결재 결재대기 리스트 조회
    ArrayList<ElecApproval> selectApprovalStandbyList(); 
    
    // 작성자 : 최선희 -- 기획안/업무연락/회람 상세 조회 
    ElecApproval documentDetail(int eano);
    
    // 작성자 : 최선희 -- 기획안/업무연락/회람 작성 
    int	insertDocument(ElecApproval ea); 
    
    // 작성자 : 최선희 -- 기획안/업무연락/회람 삭제 
    int deleteDocument(int eano);
    
    // 작성자 : 안소은 -- 전자결재 결재선 부서조회
    ArrayList<Dept> selectDept();
    
    // 작성자 : 안소은 -- 지출결의서(통합문서)상세조회
    ElecApproval expenseDetail(int eano);
    
	// 작성자 : 안소은 -- 지출결의서 조회
    ExpenseForm expenseDetailTwo(int eano);
    
	// 작성자 : 안소은 -- 부서명 조회
    ArrayList<Dept> selectDeptName(int eano);
    
	// 작성자 : 안소은 -- 직급명 조회
    ArrayList<Position> selectPosiName(int eano);
    
    // 작성자 : 안소은 -- 결재선 조회
    ArrayList<Approval_path> selectApPath(int eano);
    
    // 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
    ArrayList<Member> selectMemberList(int deptNo);
    
    // 작성자 : 김혜미 -- 연차 신청
    int insertOff(Off o);
    
    // 결재선
    int insertApprovalPath(ArrayList<Approval_path> approvalPathList);
    
    // 작성자 : 김혜미 -- 연차 상세조회
    ElecApproval detailOff(int eano);
    
    // 결재선 상세조회
    ArrayList<Approval_path> detailApprovalPath(int eano);
    
}