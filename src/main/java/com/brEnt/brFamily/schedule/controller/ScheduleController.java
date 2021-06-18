package com.brEnt.brFamily.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	@RequestMapping("calendar.sch")
	public String calendarMain() {
		// /WEB-INF/views/
		return "schedule/calendarMain";
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
