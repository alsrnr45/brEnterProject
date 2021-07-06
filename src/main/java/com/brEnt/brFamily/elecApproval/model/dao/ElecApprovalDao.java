package com.brEnt.brFamily.elecApproval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;

@Repository 
public class ElecApprovalDao {
	
	// 작성자 : 최선희 -- 전자결재 전체 리스트 조회
	public ArrayList<ElecApproval> selectApprovalTotalList(SqlSessionTemplate sqlSession) { 
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalTotalList"); 
	}
	
	// 작성자 : 안소은 -- 결재선 부서 리스트 조회
	public ArrayList<Dept> selectDept(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDept");
	}
	
	// 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, int deptNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMemberList", deptNo);
	}
	
	
	
	
	
	
	
	
	
}
