package com.brEnt.brFamily.boardFree.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardFree.model.service.BoardFreeService;
import com.brEnt.brFamily.boardFree.model.vo.BoardFree;
import com.brEnt.brFamily.boardFree.model.vo.BoardFreeReply;
import com.google.gson.Gson;

@Controller
public class BoardFreeController {
	
	@Autowired
	private BoardFreeService bfService; 
	
	
	// 자유게시판 리스트 조회
	@RequestMapping("boardFreeList.bf")
	public ModelAndView boardFreeList(ModelAndView mv) { 
		
		ArrayList<BoardFree> list = bfService.selectBoardFreeList();
		
		mv.addObject("list", list)
		  .setViewName("boardFree/boardFreeList"); 
		
		return mv;
	}

	
	// 자유게시판 상세 조회 
	@RequestMapping("boardFreeDetail.bf")
	public String selectBoardFree(int bfno, Model model) {
		
		int result = bfService.increaseCount(bfno); 
		
		if(result > 0) {
			BoardFree bf = bfService.selectBoardFree(bfno); 
			model.addAttribute("bf", bf); 
			return "boardFree/boardFreeDetail"; 
			
		}else { 
			model.addAttribute("errorMsg", "자유게시글 상세 조회 실패"); 
			return "common/errorPage"; 
		}		
	}
	
	
	// 관리자 자유게시판 리스트 조회
	@RequestMapping("adminBoardFreeList.bf")
	public ModelAndView adminBoardFreeList(ModelAndView mv) { 
				
		ArrayList<BoardFree> list = bfService.adminSelectBoardFreeList();
				
		mv.addObject("list", list)
		  .setViewName("boardFree/adminBoardFreeList"); 
				
		return mv; 
	}
		
		
	// 관리자 자유게시판 상세 조회
	@RequestMapping("adminBoardFreeDetail.bf")
	public String adminSelectBoardFree(int bfno, Model model) {
			
		int result = bfService.adminIncreaseCount(bfno); 
			
		if(result > 0) {
			BoardFree bf = bfService.adminSelectBoardFree(bfno); 
			model.addAttribute("bf", bf); 
			return "boardFree/adminBoardFreeDetail"; 
				
		}else { 
			model.addAttribute("errorMsg", "관리자 자유게시글 상세 조회 실패"); 
			return "common/errorPage"; 
		}		
	}
	
	
	// 자유게시판 작성
	@RequestMapping("boardFreeEnroll.bf")
	public String boardFreeEnroll() {
		return "boardFree/boardFreeEnroll"; 
	}
	
	@RequestMapping("insertBoardFree.bf")
	public String insertBoardFree(BoardFree bf, MultipartFile upfile, HttpSession session, Model model) { 
	
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버에 업로드 => 파일 원본명, 실제 서버에 업로드된 경로를 bf에 추가로 담기 
		if(!upfile.getOriginalFilename().equals("")) { 
			
			String changeName = saveFile(session, upfile); 
			
			bf.setFreeFileOrigin(upfile.getOriginalFilename()); 
			bf.setFreeFileUpdate("resources/freeUpfiles/" + changeName); // 업로드된파일명 + 파일명
			
		}
		
		int result = bfService.insertBoardFree(bf); 
		
		// 성공했을 경우 
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 게시글이 작성되었습니다.");
			return "redirect:boardFreeList.bf";
		// 실패했을 경우 
		}else { 
			model.addAttribute("errorMsg", "게시글 작성 실패"); 
			return "common/errorPage"; 
		}	
				
	}
		
		
	// 자유게시판 수정 
	@RequestMapping("updateBoardFreeForm.bf")
	public String updateBoardFreeForm(int bfno, HttpSession session, Model model) { 
		//BoardFree bf = bfService.selectBoardFree(bfno); 
		//model.addAttribute("bf", bf); 
		model.addAttribute("bf", bfService.selectBoardFree(bfno)); 
		return "boardFree/boardFreeUpdate"; 
	}
	
	@RequestMapping("updateBoardFree.bf")
	public String updateBoardFree(BoardFree bf, MultipartFile reupfile, HttpSession session, Model model) { 
	
		if(!reupfile.getOriginalFilename().equals("")) { // 새로 넘어온 첨부파일이 있을 경우 
			 
			// 새로 넘어온 첨부파일이 있는데 기존의 첨부파일이 있을 경우 => 서버에 업로드되어있는 기존의 파일 찾아서 지울 것 
			if(bf.getFreeFileUpdate() != null) {
				new File(session.getServletContext().getRealPath(bf.getFreeFileUpdate())).delete(); 
			}
			
			// 새로 넘어온 첨부파일 서버에 업로드 
			String changeName = saveFile(session, reupfile); 
			bf.setFreeFileOrigin(reupfile.getOriginalFilename());
			bf.setFreeFileUpdate("resources/freeUpfiles/" + changeName);
		}
		
		/*
		 * case 1. 새로 첨부된 파일 x, 기존의 첨부파일 x 
		 * 		=> freeFileOrigin : null, freeFileUpdate : null 
		 * 
		 * case 2. 새로 첨부된 파일 x, 기존의 첨부파일 o 
		 * 		=> freeFileOrigin : 기존의 첨부파일 원본명, freeFileUpdate : 기존의 첨부파일 수정명 
		 * 
		 * case 3. 새로 첨부된 파일 o, 기존의 첨부파일 x 
		 * 		=> freeFileOrigin : 새로운 첨부파일 원본명, freeFileUpdate : 새로운 첨부파일 수정명 
		 * 
		 * case 4. 새로 첨부된 파일 o, 기존의 첨부파일 o
		 * 		=> freeFileOrigin : 새로운 첨부파일 원본명, freeFileUpdate : 새로운 첨부파일 수정명 
		 */
		int result = bfService.updateBoardFree(bf); 
		
		if(result > 0) { // 성공 => boardFreeDetail.bf?bfno=글번호     url 재요청 => 상세보기 페이지 
			session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다."); 
			return "redirect:boardFreeDetail.bf?bfno=" + bf.getFreeNo();
			
		}else { // 실패 => 에러 문구 담아서 => 에러 페이지 포워딩  
			model.addAttribute("errorMsg", "게시글 수정 실패"); 
			return "common/errorPage"; 
		}
		
	}
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에 업로드시킨 후 해당 수정된 파일명(서버에 업로드된 파일명)을 반환하는 메소드 
	public String saveFile(HttpSession session, MultipartFile upfile) {
				
		String savePath = session.getServletContext().getRealPath("/resources/freeUpfiles/");
				
		String originName = upfile.getOriginalFilename(); // 원본명 ("aaa.jpg") 
				
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
	
	
	// 자유게시판 삭제 
	@RequestMapping("deleteBoardFree.bf")
	public String deleteBoardFree(int bfno, String filePath, 
				  				  HttpSession session, Model model) {
			// filePath : 첨부파일 존재했다면 	  "resources/freeUpfiles/xxxxxx.pdf" 
			// filePath : 첨부파일 존재하지 않았다면 "" 
	
		int result = bfService.deleteBoardFree(bfno); 
	
		if(result > 0) {
	
			// 첨부파일이 있을 경우 => 서버에 업로드된 파일 찾아서 삭제 
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete(); 
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:boardFreeList.bf"; 
	
		}else { 
		
			model.addAttribute("errorMsg", "게시글 삭제 실패"); 
			return "common/errorPage";

		}
	
	}
	
	
	// 관리자 자유게시판 삭제	
	@RequestMapping("adminDeleteBoardFree.bf")
	public String adminDeleteBoardFree(int bfno, HttpSession session, Model model) {
	
		int result = bfService.deleteBoardFree(bfno); 
	
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:adminBoardFreeList.bf"; 
	
		}else { 
		
			model.addAttribute("errorMsg", "관리자 게시글 삭제 실패"); 
			return "common/errorPage";

		}
	
	}
	
	
	// 관리자 댓글 리스트 조회 
	@ResponseBody
	@RequestMapping(value="adminRlist.bf", produces="application/json; charset=utf-8")
	public String adminSelectReplyList(int bfno) {
		//ArrayList<BoardFreeReply> list = bfService.selectReplyList(bfno); 
		//return new Gson().toJson(list);
		return new Gson().toJson(bfService.adminSelectReplyList(bfno)); 
	}
	
	
	// 댓글 리스트 조회 
	@ResponseBody
	@RequestMapping(value="rlist.bf", produces="application/json; charset=utf-8")
	public String selectReplyList(int bfno) {
		//ArrayList<BoardFreeReply> list = bfService.selectReplyList(bfno); 
		//return new Gson().toJson(list);
		return new Gson().toJson(bfService.selectReplyList(bfno)); 
	}
	
	
	// 댓글 작성 
	@ResponseBody
	@RequestMapping("rinsert.bf")
	public String insertReply(BoardFreeReply r) {
		int result = bfService.insertReply(r); 
		if(result > 0) {
			return "success"; 
		}else { 
			return "fail"; 
		}
	}
	
	
	// 댓글 수정 
	@ResponseBody
	@RequestMapping("rupdate.bf")
	public String updateReply(BoardFreeReply r) {
		// System.out.println(r); 

		int result = bfService.updateReply(r); 

		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}		
	}
	

	// 댓글 삭제 
	@ResponseBody
	@RequestMapping("rdelete.bf")
	public String deleteReply(int rno) { 
		int result = bfService.deleteReply(rno); 
		if(result > 0) {
			return "success"; 
		}else { 
			return "fail"; 
		}
	}
	
		
}
