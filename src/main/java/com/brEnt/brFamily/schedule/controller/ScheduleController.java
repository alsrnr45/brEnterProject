package com.brEnt.brFamily.schedule.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.schedule.model.service.ScheduleService;
import com.brEnt.brFamily.schedule.model.vo.Schedule;
import com.brEnt.brFamily.schedule.model.vo.ScheduleFile;
import com.google.gson.Gson;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;
	
	// 1. 일정 조회
	@RequestMapping("calendar.sch")
	public ModelAndView calendarMain(HttpSession session, ModelAndView mv) {
		// /WEB-INF/views/
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("memNo", ((Member)session.getAttribute("loginUser")).getMemNo());
		map.put("deptNo", ((Member)session.getAttribute("loginUser")).getDeptNo());
		
		ArrayList<Schedule> list = sService.selectList(map);
		
		mv.addObject("list", list)
		  .setViewName("schedule/calendarMain");
		
		return mv;
	}
	
	// 2. 일정 만들기 페이지 이동
	@RequestMapping("enroll.sch")
	public String enrollSch(String selected_date, Model model) {
		if(selected_date != null) {
			model.addAttribute("selected_date", selected_date);
			return "schedule/enrollSch";
		} else {
			return "schedule/enrollSch";
		}
		
	}
	
	// 일정 추가
	@RequestMapping("insert.sch")
	public String planSch(Schedule s, HttpSession session, ModelAndView mv) {
		System.out.println(s);
		int result = sService.planSch(s);
		
		if(result>0) {
				
				mv.addObject("s", s);
				return "redirect:calendar.sch";
		} else {
			mv.addObject("errorPage", "게시글 작성 실패!");
			return "common/errorPage";
		}
		
	}
	
	// 일정 첨부파일 추가
	@RequestMapping("insert.schF")
	public void planSchF(ScheduleFile sf, MultipartFile upfile, HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) {
			String changeFileName = saveFile(upfile ,session);

			sf.setSchOriginName(upfile.getOriginalFilename());
			sf.setSchUpdateName("resources/scheduleUpfiles/");
		}
	}
	
	// 일정 수정페이지 이동
	@RequestMapping(value="requestUpdate.sch", produces="text/html; charset=utf-8")
	public String reqUpdateSch(int schNo, Model model) {
		Schedule s = sService.reqUpdateSch(schNo);
		model.addAttribute("s", s);
		return "schedule/enrollSch";
	}
	
	// 전달된 첨부파일 이름 수정작업
	private String saveFile(MultipartFile upfile, HttpSession session) {
		String savePath = session.getServletContext().getRealPath("resources/scheduleUpfiles/");
		
		String originName = upfile.getOriginalFilename(); // 파일의 원본명("aaa.jpg")
		
		// 수정명 이름 만들기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmsss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}

	@RequestMapping("adminCalendar.sch")
	public ModelAndView adminCalendar(HttpSession session, ModelAndView mv) {
		// /WEB-INF/views/
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("memNo", ((Member)session.getAttribute("loginUser")).getMemNo());
		map.put("deptNo", ((Member)session.getAttribute("loginUser")).getDeptNo());
		
		ArrayList<Schedule> list = sService.selectList(map);
		
		mv.addObject("list", list)
		  .setViewName("schedule/adminCalendarMain");
		
		return mv;
	}
	
	@RequestMapping("adminEnroll.sch")
	public String adminEnrollSch() {
		return "schedule/adminEnrollSch";
	}
	

	
	@RequestMapping("min.sch")
	public String minSch() {
		return "schedule/min-calendar";
	}
	
	
}
