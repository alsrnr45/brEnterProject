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

	// 작성자 : 최선희 -- 전자결재 전체 리스트 
	@RequestMapping("approvalTotalList.ea")
	public String approvalTotalList() {
		return "elecApproval/approvalTotalList";
	}
		
	// 작성자 : 최선희 -- 전자결재 진행중인 문서 승인 리스트 
	@RequestMapping("approvalOkList.ea")
	public String approvalOkList() {
		return "elecApproval/approvalOkList";
	}	
		
	// 작성자 : 최선희 -- 전자결재 진행중인 문서 반려 리스트 
	@RequestMapping("approvalReturnList.ea")
	public String approvalReturnList() {
		return "elecApproval/approvalReturnList";
	}
			
	// 작성자 : 최선희 -- 전자결재 진행중인 문서 대기 리스트 
	@RequestMapping("approvalStandbyList.ea")
	public String approvalStandbyList() {
		return "elecApproval/approvalStandbyList";
	}
		
	// 작성자 : 최선희 -- 기획안/업무연락/회람 작성폼  
	@RequestMapping("documentEnrollForm.ea")
	public String documentEnrollForm() {
		return "elecApproval/documentEnrollForm";
	} 
		
	// 작성자 : 최선희 -- 기획안/업무연락/회람 수정폼  
	@RequestMapping("documentUpdateForm.ea")
	public String documentUpdateForm() {
		return "elecApproval/documentUpdateForm";
	}
	
	// 작성자 : 최선희 -- 기획안/업무연락/회람 상세페이지
	@RequestMapping("documentDetail.ea")
	public String documentDetail() {
		return "elecApproval/documentDetail";
	}
	
	
	
	
	
	
	
	
}
