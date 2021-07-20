package com.brEnt.brFamily.elecApproval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.brEnt.brFamily.elecApproval.model.vo.Approval_path;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.elecApproval.model.vo.ExpenseForm;
import com.brEnt.brFamily.elecApproval.model.vo.Off;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;

@Repository 
public class ElecApprovalDao {
	
	// 작성자 : 최선희 -- 전자결재 기안함 리스트 조회
	public ArrayList<ElecApproval> selectApprovalTotalList(SqlSessionTemplate sqlSession) { 
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalTotalList");
	}
	
	// 작성자 : 최선희 -- 전자결재 결재대기 리스트 조회
	public ArrayList<ElecApproval> selectApprovalStandbyList(SqlSessionTemplate sqlSession, int mno) { 
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalStandbyList", mno);
	}
	
	// 작성자 : 최선희 -- 기획안/업무연락/회람 상세 조회 
	public ElecApproval documentDetail(SqlSessionTemplate sqlSession, int eano) {
		return sqlSession.selectOne("approvalMapper.documentDetail", eano);
	}
	
	// 작성자 : 최선희 -- 기획안/업무연락/회람 작성
	public int insertDocument(SqlSessionTemplate sqlSession, ElecApproval ea) {		
		return sqlSession.insert("approvalMapper.insertDocument", ea); 
	}
	
	// 작성자 : 최선희 -- 기획안/업무연락/회람 삭제 
	public int deleteDocument(SqlSessionTemplate sqlSession, int eano) { 
		return sqlSession.update("approvalMapper.deleteDocument", eano); 
	}
	
	// 작성자 : 안소은 -- 결재선 부서 리스트 조회
	public ArrayList<Dept> selectDept(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDept");
	}
	
	// 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, int deptNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMemberList", deptNo);
	}
	
	// 작성자 : 안소은 -- 지출결의서 상세조회
	public ElecApproval expenseDetail(SqlSessionTemplate sqlSession, int eano) {
		return sqlSession.selectOne("approvalMapper.expenseDetail", eano);
	}
	
	public int insertEcDocument(SqlSessionTemplate sqlSession, ElecApproval ea) {
		return sqlSession.insert("approvalMapper.insertEcDocument", ea);
	}
	
	public int insertExpense(SqlSessionTemplate sqlSession, ExpenseForm ex) {
		return sqlSession.insert("approvalMapper.insertExpense", ex);
	}
	
	// 작성자 : 김혜미 -- 연차 신청
	public int insertOff(SqlSessionTemplate sqlSession, Off o) {
		return sqlSession.insert("approvalMapper.insertOff", o);
	}
	
	// 작성자 : 김혜미 -- 연차 상세조회
	public ElecApproval detailOff(SqlSessionTemplate sqlSession, int ecDocNo) {
		return sqlSession.selectOne("approvalMapper.detailOff", ecDocNo);
	}
	
	// 작성자 : 김혜미 -- 결재선  등록
	public int insertApprovalPath(SqlSessionTemplate sqlSession, ArrayList<Approval_path> approvalPathList) {
		
		int result = 0;
		
		for(int i=0; i<approvalPathList.size(); i++) {
			//System.out.println(approvalPathList.get(i));
			result = sqlSession.insert("approvalMapper.insertApprovalPath", approvalPathList.get(i));
		}
		return result;
	}

	// 작성자 : 김혜미 -- 결재선 상세조회
	public ArrayList<Approval_path> detailApprovalPath(SqlSessionTemplate sqlSession, int eano) {
		return (ArrayList)sqlSession.selectList("approvalMapper.detailApprovalPath", eano);
	}

	// 작성자 : 김혜미 -- 결재 승인
	public int approveDocument(SqlSessionTemplate sqlSession, int approvalPathNo) {
		return sqlSession.update("approvalMapper.approveDocument", approvalPathNo);
	}

	// 작성자 : 김혜미 -- 결재 최종승인
	public int finalApprove(SqlSessionTemplate sqlSession, int finalApproval, int eano, int memNo) {
		
		int result = 0; 
		
		if((int)finalApproval == (int)memNo) {
			result = sqlSession.update("approvalMapper.finalApprove", eano);
		}
		return result;
	}
	
	
	
	
}
