package com.brEnt.brFamily.elecApproval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.elecApproval.model.service.ElecApprovalService;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.vo.Dept;
import com.brEnt.brFamily.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class ElecApprovalController {
   
   @Autowired
   private ElecApprovalService eaService;
   
   
   // 작성자 : 김혜미 -- 연차 신청폼
   @RequestMapping("offEnrollForm.ea")
   public ModelAndView offEnrollForm(ModelAndView mv) {
      
      ArrayList<Dept> list = eaService.selectDept();
      //System.out.println(list);
      mv.addObject("list", list)
          .setViewName("elecApproval/offEnrollForm");
      
      return mv;
   }
   
   // 작성자 : 김혜미 -- 연차 신청폼
   @RequestMapping("offCheckForm.ea")
   public String offCheckForm() {
      return "elecApproval/offCheckForm";
   }

   // 작성자 : 최선희 -- 전자결재 전체 리스트 
   @RequestMapping("approvalTotalList.ea")
   public ModelAndView approvalTotalList(ModelAndView mv) {
      	 
      ArrayList<ElecApproval> list = eaService.selectApprovalTotalList();
      
      mv.addObject("list", list)
        .setViewName("elecApproval/approvalTotalList"); 
      
      return mv;            
   }
   
   // 작성자 : 최선희 -- 전자결재 진행중인 문서 대기 리스트 
   @RequestMapping("approvalStandbyList.ea")
   public String approvalStandbyList() {
      return "elecApproval/approvalStandbyList";
   }
      
   // 작성자 : 최선희 — 기획안/업무연락/회람 작성폼  
   @RequestMapping("documentEnrollForm.ea")
   public ModelAndView documentEnrollForm(String code, ModelAndView mv) {   
	   ArrayList<Dept> list = eaService.selectDept();
	   //System.out.println(list);
	   mv.addObject("list", list)
	     .addObject("code", code)
	     .setViewName("elecApproval/documentEnrollForm");
	   
	   return mv;
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
   
   // 작성자 : 최선희 -- 관리자 전자결재 전체 리스트 
   @RequestMapping("adminApprovalTotalList.ea")
   public String adminApprovalTotalList() {
      return "elecApproval/adminApprovalTotalList";
   }
   
   // 작성자 : 최선희 -- 관리자 전자결재 진행중인 문서 승인 리스트 
   @RequestMapping("adminApprovalStandbyList.ea")
   public String adminApprovalStandbyList() {
      return "elecApproval/adminApprovalStandbyList";
   }
   
   // 작성자 : 최선희 -- 관리자 기획안/업무연락/회람 상세 페이지
   @RequestMapping("adminDocumentDetail.ea")
   public String adminDocumentDetail() {
      return "elecApproval/adminDocumentDetail";
   }
   
   // 작성자 : 안소은 — 지출결의서 폼
   @RequestMapping("expenseForm.ea")
   public ModelAndView expenseForm(ModelAndView mv) {
	   
	   ArrayList<Dept> list = eaService.selectDept();
	   mv.addObject("list", list)
	   	 .setViewName("elecApproval/expenseForm");
	   
	   return mv;
	   
   }

   // 작성자 : 안소은 — 지출결의서 상세페이지
   @RequestMapping("expenseDetail.ea")
   public String expenseDetail() {
	   return "elecApproval/expenseDetail";
   }
   
   // 작성자 : 안소은 — 결재선 해당 부서 사원 조회용 AJAX
   @ResponseBody
   @RequestMapping(value="memberList.ea", produces="application/json; charset=utf-8")
   public String ajaxSelectMember(int deptNo) {
	   return new Gson().toJson(eaService.selectMemberList(deptNo));
   }
  
   
   
}