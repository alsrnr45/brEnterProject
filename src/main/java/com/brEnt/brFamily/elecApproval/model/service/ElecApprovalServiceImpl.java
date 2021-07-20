package com.brEnt.brFamily.elecApproval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.boardFree.model.vo.BoardFree;
import com.brEnt.brFamily.elecApproval.model.dao.ElecApprovalDao;
import com.brEnt.brFamily.elecApproval.model.vo.Approval_path;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.elecApproval.model.vo.ExpenseForm;
import com.brEnt.brFamily.elecApproval.model.vo.Off;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.member.model.vo.Position;

@Service
public class ElecApprovalServiceImpl implements ElecApprovalService {
   
   @Autowired 
   private SqlSessionTemplate sqlSession;
   @Autowired
   private ElecApprovalDao eaDao; 
   
   
   // 작성자 : 최선희 -- 전자결재 기안함 리스트 조회 
   @Override
   public ArrayList<ElecApproval> selectApprovalTotalList() {
      return eaDao.selectApprovalTotalList(sqlSession); 
   }
   
   // 작성자 : 최선희 -- 전자결재 결재대기 리스트 조회 
   @Override
   public ArrayList<ElecApproval> selectApprovalStandbyList(int mno) {
      return eaDao.selectApprovalStandbyList(sqlSession, mno); 
   }
      
   // 작성자 : 최선희 -- 기획안/업무연락/회람 상세 조회  
   @Override
   public ElecApproval documentDetail(int eano) {
	   return eaDao.documentDetail(sqlSession, eano);
   }
     
   // 작성자 : 최선희 -- 기획안/업무연락/회람 작성 
   @Override
   public int insertDocument(ElecApproval ea) { 
	   return eaDao.insertDocument(sqlSession, ea); 
   }
   
   // 작성자 : 최선희 -- 기획안/업무연락/회람 삭제
   @Override
   public int deleteDocument(int eano) {
	   return eaDao.deleteDocument(sqlSession, eano); 
   }
     
   // 작성자 : 안소은 -- 결재선 부서 리스트 조회
   @Override
   public ArrayList<Dept> selectDept() {
	   return eaDao.selectDept(sqlSession);
   }
   
   // 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
   @Override	
   public ArrayList<Member> selectMemberList(int deptNo) {
	   return eaDao.selectMemberList(sqlSession, deptNo);
   }

   // 작성자 : 안소은 -- 지출결의서 상세조회
   @Override
   public ElecApproval expenseDetail(int eano) {
	   return eaDao.expenseDetail(sqlSession, eano);
   }
   
   @Override
   public int insertEcDocument(ElecApproval ea) {
   		return eaDao.insertEcDocument(sqlSession, ea);
   }

   @Override
   public int insertExpense(ExpenseForm ex) {
   		return eaDao.insertExpense(sqlSession, ex);
   }
   
	// 작성자 : 김혜미 -- 연차 신청
	@Override
	public int insertOff(Off o) {
	   return eaDao.insertOff(sqlSession, o);
	}
   
	// 작성자 : 김혜미 -- 연차 상세조회
	@Override
	public ElecApproval detailOff(int eano) {
	   return eaDao.detailOff(sqlSession, eano);
	}
	
	// 작성자 : 김혜미 -- 연차 삭제
	@Override
	public int deleteOff(int eano) {
		return eaDao.deleteOff(sqlSession, eano);
	}

	// 작성자 : 김혜미 -- 결재선  등록
	@Override
	public int insertApprovalPath(ArrayList<Approval_path> approvalPathList) {
		return eaDao.insertApprovalPath(sqlSession, approvalPathList);
	}
   
	// 작성자 : 김혜미 -- 결재선 상세조회
	@Override
	public ArrayList<Approval_path> detailApprovalPath(int eano) {
		return eaDao.detailApprovalPath(sqlSession, eano);
	}

	// 작성자 : 김혜미 -- 결재 승인
	@Override
	public int approveDocument(int approvalPathNo) {
		return eaDao.approveDocument(sqlSession, approvalPathNo);
	}

	// 작성자 : 김혜미 -- 결재 최종승인
	@Override
	public int finalApprove(int finalApproval, int eano, int memNo) {
		return eaDao.finalApprove(sqlSession, finalApproval, eano, memNo);
	}

	



}
