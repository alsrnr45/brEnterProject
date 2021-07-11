package com.brEnt.brFamily.elecApproval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.boardFree.model.vo.BoardFree;
import com.brEnt.brFamily.elecApproval.model.dao.ElecApprovalDao;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApprovalFile;
import com.brEnt.brFamily.elecApproval.model.vo.Off;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;

@Service
public class ElecApprovalServiceImpl implements ElecApprovalService {
   
   @Autowired 
   private SqlSessionTemplate sqlSession;
   @Autowired
   private ElecApprovalDao eaDao; 
   
   
   // 작성자 : 최선희 -- 전자결재 리스트 조회 
   @Override
   public ArrayList<ElecApproval> selectApprovalTotalList() {
      return eaDao.selectApprovalTotalList(sqlSession); 
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
   
   @Override
   public int insertDocumentFile(ElecApprovalFile eaf) { 
	   return eaDao.insertDocumentFile(sqlSession, eaf); 
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

	// 작성자 : 김혜미 -- 연차 신청
	@Override
	public int offInsert(Off o) {
		return eaDao.offInsert(sqlSession, o);
	}

	// 작성자 : 김혜미 -- 연차 조회
	@Override
	public ElecApproval offDetail(int eano) {
		return eaDao.offDetail(sqlSession, eano);
	}

	

   

}