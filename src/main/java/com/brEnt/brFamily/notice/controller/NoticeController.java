package com.brEnt.brFamily.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
//		
//		ArrayList<Notice> list = nService.selectNoticeList();
//		
//		mv.addObject("list", list)
//		  .setViewName("notice/noticeList");
//		
//		return mv;
		
	}
	
}
