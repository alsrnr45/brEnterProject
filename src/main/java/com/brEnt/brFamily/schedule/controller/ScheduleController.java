package com.brEnt.brFamily.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.brEnt.brFamily.member.model.vo.Member;
import com.brEnt.brFamily.schedule.model.service.ScheduleService;
import com.brEnt.brFamily.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;

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
	
	@RequestMapping("enroll.sch")
	public String enrollSch() {
		return "schedule/enrollSch";
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
