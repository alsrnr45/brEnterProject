package com.brEnt.brFamily.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	@RequestMapping("list.mail")
	public String mailListView() {
		return "mail/mailListView";
	}
	
	@RequestMapping("receive.mail")
	public String receiveMailListView() {
		return "mail/receiveMailListView";
	}
	
	@RequestMapping("send.mail")
	public String sendMailListView() {
		return "mail/sendMailListView";
	}
	
	@RequestMapping("temp.mail")
	public String mailTempBox() {
		return "mail/mailTempBox";
	}
	
	@RequestMapping("bin.mail")
	public String mailRecycleBin() {
		return "mail/mailRecycleBin";
	}
	
	@RequestMapping("enroll.mail")
	public String enrollMail() {
		return "mail/enrollMail";
	}
}
