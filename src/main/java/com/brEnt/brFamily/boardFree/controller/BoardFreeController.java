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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.boardFree.model.service.BoardFreeService;
import com.brEnt.brFamily.boardFree.model.vo.BoardFree;

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
	@RequestMapping("boardFreeUpdate.bf")
	public String boardFreeUpdate() {
		return "boardFree/boardFreeUpdate"; 
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
	



	
	
	
	
	
}
