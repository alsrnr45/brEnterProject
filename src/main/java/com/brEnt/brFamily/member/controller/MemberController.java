package com.brEnt.brFamily.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardFree.model.vo.BoardFree;
import com.brEnt.brFamily.elecApproval.model.service.ElecApprovalService;
import com.brEnt.brFamily.elecApproval.model.vo.ElecApproval;
import com.brEnt.brFamily.member.model.service.MemberService;
import com.brEnt.brFamily.member.model.vo.Member;

@Controller
public class MemberController {

   @Autowired 
   private MemberService mService; //변수선언(전역변수 세팅)
   
   
   // 작성자 : 정예빈 - 로그인 
   @RequestMapping("login.me")
   public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
      
	   Member loginUser = mService.loginMember(m);
      
	   if(loginUser == null) { // 로그인 실패
		   System.out.println("로그인 실패");
         
		   mv.setViewName("redirect:/");
      
	   }else { // 로그인 성공  
		   ArrayList<ElecApproval> list = mService.selectApprovalTotalList();                          
	         
		   session.setAttribute("loginUser", loginUser);
         
		   mv.addObject("list", list)
             .setViewName("common/userMain");    
	   }
	   return mv;
   }
  
   // 작성자 : 정예빈 - 로그아웃
   @RequestMapping("logout.me")
   public String logoutMember(HttpSession session) {
      
	  session.invalidate();
      return "member/login";
   }
   
   
   // 작성자 : 김혜미 - 신규사원 리스트조회
   @RequestMapping("newMemberList.admin")
   public ModelAndView newMemberList(ModelAndView mv) {
      
      ArrayList<Member> list = mService.newMemberList();
      mv.addObject("list", list)
        .setViewName("member/adminNewMemberList");
      
      return mv;
   }
   
   
   // 작성자 : 김혜미 -- 신규사원 상세조회
   @RequestMapping("newMemberDetail.admin")
   public String newMemberDetail(int mno, Model model) {
      
      Member m = mService.newMemberDetail(mno);
      model.addAttribute("m", m);
      
      return "member/adminNewMemberDetail";
   }

   
   // 작성자 : 김혜미 -- 신규사원 등록
   @RequestMapping("enrollNewMember.admin")
   public String enrollNewMember(Member m, MultipartFile upfile, HttpSession session, Model model) {
	   
      if(!upfile.getOriginalFilename().equals("")) { 
         String changeName = saveFile(session, upfile); 
         m.setProfile("resources/profileUpfiles/" + changeName);
      }
      int result = mService.enrollNewMember(m);
      return "redirect:newMemberList.admin";
   }
   
   
   // 작성자 : 김혜미 -- 신규사원 반려
   @RequestMapping("returnMember.admin")
   public String returnMember(int mno, Model model) {
      int result = mService.returnMember(mno);
      return "redirect:newMemberList.admin";
   }

   
   // 작성자 : 김혜미 -- 사원 리스트조회
   @RequestMapping("memberList.admin")
   public ModelAndView memberList(ModelAndView mv) {
      
      ArrayList<Member> list = mService.memberList();
      mv.addObject("list", list)
        .setViewName("member/adminMemberList");
      
      return mv;
   }   

   
   // 작성자 : 김혜미 -- 사원 상세조회
   @RequestMapping("memberDetail.admin")
   public String memberDetail(int mno, Model model) {
      
      Member m = mService.memberDetail(mno);
      model.addAttribute("m", m);
      
      return "member/adminMemberDetail";
   }
   
   
   // 작성자 : 김혜미 -- 사원 수정폼
   @RequestMapping("memberUpdateForm.admin")
   public String memberUpdateForm(int mno, Model model) {
      
      Member m = mService.memberDetail(mno);
      model.addAttribute("m", m);
      
      return "member/adminMemberUpdateForm";
   }
   
   // 작성자 : 김혜미 - 사원 수정
   @RequestMapping("memberUpdate.admin")
   public String updateMember(Member m, MultipartFile upfile, HttpSession session, Model model) {
      
	   if(!upfile.getOriginalFilename().equals("")) { 
	         String changeName = saveFile(session, upfile); 
	         m.setProfile("resources/profileUpfiles/" + changeName);
      }
      int result = mService.updateMember(m);
//      model.addAttribute("m", m);
      
      return "redirect:memberList.admin";
   }
   
   
   // 작성자 : 김혜미 - 사원 탈퇴
//   @RequestMapping("delete.me")
//   public String deleteMember(String userPwd, HttpSession session, Model model) {
//      
//      Member loginUser = (Member)session.getAttribute("loginUser");
//      // 아이디, 비번(암호문), 이메일, 주소, ....
//      
//      if(bcryptPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
//         // 비밀번호 일치 => 본인 맞음
//         int result = mService.deleteMember(loginUser.getUserId());
//         
//         if(result > 0) {
//            session.removeAttribute("loginUser");
//            session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
//            
//            // => 메인페이지
//            return "redirect:/";
//            
//         }else { // => 에러페이지
//            model.addAttribute("errorMsg", "회원탈퇴 실패");
//            return "common/errorPage";
//         }
//         
//         
//      }else {
//         // 비밀번호 일치 x
//         session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
//         return "redirect:myPage.me";
//      }
//      
//   }

   
   // 작성자 : 김혜미 -- 첨부파일명 수정 
   public String saveFile(HttpSession session, MultipartFile upfile) {
      
      String savePath = session.getServletContext().getRealPath("/resources/profileUpfiles/");
            
      String originName = upfile.getOriginalFilename();
            
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
      int ranNum = (int)(Math.random() * 900000 + 10000); 
      String ext = originName.substring(originName.lastIndexOf(".")); 
            
      String changeName = currentTime + ranNum + ext;
            
      try {
         upfile.transferTo(new File(savePath + changeName));
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }
      return changeName;
   }   
   
}