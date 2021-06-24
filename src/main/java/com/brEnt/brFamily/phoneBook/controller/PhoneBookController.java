package com.brEnt.brFamily.phoneBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PhoneBookController {

	@RequestMapping("list.pb")
	public String receiveMailListView() {
		return "phoneBook/phoneBookListView";
	}
	
	@RequestMapping("popup.pb")
	public String popupView() {
		return "phoneBook/phoneBookPopup";
	}
}
