package com.brEnt.brFamily.elecApproval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;

@Repository 
public class ElecApprovalDao {
	
	// 작성자 : 최선희 -- 전자결재 전체 리스트 조회
	public ArrayList<ElecApproval> selectApprovalTotalList(SqlSessionTemplate sqlSession) { 
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalTotalList"); 
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
