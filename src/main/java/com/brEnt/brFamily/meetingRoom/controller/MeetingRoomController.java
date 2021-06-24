package com.brEnt.brFamily.meetingRoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetingRoomController {

	@RequestMapping("test.mt")
	public String test() {
		return "meetingRoom/rezListView";
	}
	
	@RequestMapping("reservation.mt")
	public String rezDo() {
		return "meetingRoom/rezDo";
	}
}
