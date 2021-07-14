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
	
	// 작성자 : 최선희 -- 전자결재 리스트 조회
	public ArrayList<ElecApproval> selectApprovalTotalList(SqlSessionTemplate sqlSession) { 
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalTotalList");
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
	
	// 작성자 : 안소은 -- 지출결의서(통합문서) 상세조회
	public ElecApproval expenseDetail(SqlSessionTemplate sqlSession, int eano) {
		return sqlSession.selectOne("approvalMapper.expenseDetail", eano);
	}
	
	// 작성자 : 안소은 -- 지출결의서 상세조회
	public ExpenseForm expenseDetailTwo(SqlSessionTemplate sqlSession, int eano) {
		return sqlSession.selectOne("approvalMapper.expenseDetailTwo", eano);
	}
	
	// 작성자 : 안소은 -- 부서명 조회
	public ArrayList<Dept> selectDeptName(SqlSessionTemplate sqlSession, int eano) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeptName", eano);
	}
	
	// 작성자 : 안소은 -- 직급명 조회
	public ArrayList<Position> selectPosiName(SqlSessionTemplate sqlSession, int eano) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectPosiName", eano);
	}
	
	// 작성자 : 안소은 -- 결재선 조회
	public ArrayList<Approval_path> selectApPath(SqlSessionTemplate sqlSession, int eano) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApPath", eano);
	}
	
	// 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, int deptNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectMemberList", deptNo);
	}
	
	// 작성자 : 김혜미 -- 연차 신청
	public int offInsert(SqlSessionTemplate sqlSession, Off o) {
		return sqlSession.insert("approvalMapper.offInsert", o);
	}

	// 작성자 : 김혜미 -- 연차 조회
	public ElecApproval offDetail(SqlSessionTemplate sqlSession, int ecDocNo) {
		return sqlSession.selectOne("approvalMapper.offDetail", ecDocNo);
	}


	
	
	
	
	
	
	
	
	
}
