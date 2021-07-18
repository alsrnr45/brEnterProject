package com.brEnt.brFamily.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.notice.model.service.NoticeService;
import com.brEnt.brFamily.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	// 공지사항 리스트 조회
	@RequestMapping("noticeList.no")
	public ModelAndView noticeList(ModelAndView mv) {	
		
		ArrayList<Notice> list = nService.selectNoticeList();
		mv.addObject("list", list)
		  .setViewName("notice/noticeList");
		
		return mv;
		
	}
	
	// 공지사항 상세 조회
	@RequestMapping("noticeDetail.no")
	public String noticeDetail(int nno, Model model) {
		
		// 조회수 증가
		int result = nService.increaseCount(nno);
		
		if(result > 0) {
			Notice n = nService.selectNotice(nno);
			model.addAttribute("n", n);
			System.out.println(n);
			return "notice/noticeDetail";
			
		}else {
			model.addAttribute("errorMsg", "공지사항 상세조회 실패ㅠㅠ");
			return "common/errorPage";
		}
	}
	
	
}
