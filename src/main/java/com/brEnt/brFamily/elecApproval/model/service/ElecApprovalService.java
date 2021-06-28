package com.brEnt.brFamily.elecApproval.model.service;

import java.util.ArrayList;

import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;

public interface ElecApprovalService {
	
	// 작성자 : 최선희 -- 전자결재 전체 리스트 조회 
	ArrayList<ElecApproval> selectApprovalTotalList(); 
	
	
}
