package com.brEnt.brFamily.elecApproval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brEnt.brFamily.elecApproval.model.dao.ElecApprovalDao;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;

@Service
public class ElecApprovalServiceImpl implements ElecApprovalService {
   
   @Autowired 
   private SqlSessionTemplate sqlSession;
   @Autowired
   private ElecApprovalDao eaDao; 
   
   
   // 작성자 : 최선희 -- 전자결재 전체 리스트 조회 
   @Override
   public ArrayList<ElecApproval> selectApprovalTotalList() {
      return eaDao.selectApprovalTotalList(sqlSession); 
   }

   // 작성자 : 안소은 -- 결재선 부서 리스트 조회
   @Override
   public ArrayList<Dept> selectDept() {
	  return eaDao.selectDept(sqlSession);
   }

   // 작성자 : 안소은 -- 결재선 부서별 사원 수 조회
   @Override
   public ArrayList<Member> memCount() {
	   return eaDao.memCount(sqlSession);
   }

   // 작성자 : 안소은 -- 결재선 해당 부서 사원 조회용 AJAX
   @Override	
   public ArrayList<Member> selectMemberList(int deptNo) {
	   return eaDao.selectMemberList(sqlSession, deptNo);
   }


   

}