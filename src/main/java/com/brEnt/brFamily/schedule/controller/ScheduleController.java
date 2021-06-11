package com.brEnt.brFamily.schedule.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ScheduleController {
	@RequestMapping("calendar.sch")
	public String calendarMain() {
		// /WEB-INF/views/
		return "schedule/calendarMain";
	}
}
